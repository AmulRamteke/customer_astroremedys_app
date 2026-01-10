// ignore_for_file: must_be_immutable, deprecated_member_use

import 'dart:developer';
import 'package:AstrowayCustomer/controllers/history_controller.dart';
import 'package:AstrowayCustomer/utils/config.dart';
import 'package:AstrowayCustomer/utils/inapp_review.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/callController.dart';
import '../utils/global.dart' as global;
import 'bottomNavigationBarScreen.dart';

class PaymentScreen extends StatefulWidget {
  String url;
  PaymentScreen({super.key, required this.url});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late InAppWebViewController _controller;
  final historyController = Get.find<HistoryController>();

  void _handlePaymentSuccess() async {
    await global.splashController.getCurrentUserData();
    await historyController.getChatHistory(global.currentUserId!, false);
    if (global.iscomingFrom == 1) {
      global.iscomingFrom = 0;
      //coming form puja when low balance
      final callController = Get.find<CallController>();
      callController.setTabIndex(0);
      Get.off(() => BottomNavigationBarScreen(index: 4));
      Fluttertoast.showToast(
          msg: "Puja Ordered sucessfully",
          backgroundColor: Get.theme.primaryColor,
          textColor: Colors.white);
    } else {
      //not coming from puja low balance
      Get.off(() => BottomNavigationBarScreen(index: 0));
      await ReviewService.requestForReview();
      Fluttertoast.showToast(
          msg: "Payment Success!",
          backgroundColor: Get.theme.primaryColor,
          textColor: Colors.white);
    }
  }

  void _handlePaymentFailure() {
    Get.off(() => BottomNavigationBarScreen(index: 0));
    Fluttertoast.showToast(
        msg: "Payment Failed!",
        backgroundColor: Get.theme.primaryColor,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false disables back button
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBar(
              leading: SizedBox(),
              title: Text("Payment"),
              actions: [
                InkWell(
                  onTap: () async {
                    bool? confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Cancel Payment?"),
                        content: Text("Do you want to cancel the payment?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text("No"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                              Navigator.pop(context, false);
                            },
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      // User confirmed cancellation
                      Navigator.pop(context); // or navigate wherever you want
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Cancel Payment",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
          initialSettings: InAppWebViewSettings(
            cacheEnabled: true,
            javaScriptEnabled: true,
            javaScriptCanOpenWindowsAutomatically: true,
            useShouldOverrideUrlLoading: true,
            userAgent:
                "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36",
          ),
          onReceivedError: (controller, request, error) {
            print('error url: ${request.url}');
            print('error method: ${request.method}');
            print('error headers: ${request.headers}');
            print('error isRedirect: ${request.isRedirect}');
            print('error : ${error.toString()}');
          },
          onLoadResource: (controller, resource) {
            log('onLoadResource : $resource');
          },
          onLoadStart: (controller, url) {
            log('start url: ${url.toString()}');
          },
          onReceivedHttpError: (controller, request, error) {
            log('http error: ${error.toString()} and req is $request');
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var url = navigationAction.request.url.toString();

            if (url.startsWith('upi://') || url.startsWith('intent://')) {
              try {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalApplication);
                return NavigationActionPolicy.CANCEL;
              } catch (e) {
                log('Error launching URL: $e');
              }
            }

            // Handle "UNKNOWN URL SCHEME" error by allowing normal URLs
            if (!url.startsWith('http')) {
              log('Blocked unknown URL scheme: $url');
              return NavigationActionPolicy.CANCEL;
            }

            return NavigationActionPolicy.ALLOW;
          },
          onLoadStop: (controller, url) async {
            log('onLoadStop called: ${url.toString()} match with /n${websiteUrl}/payment-success');
            if (url.toString().split("?").first ==
                "${websiteUrl}payment-success") {
              _handlePaymentSuccess();
            } else if (url.toString().split("?").first ==
                "${websiteUrl}payment-failed") {
              _handlePaymentFailure();
            }
          },
          onWebViewCreated: (webviewcontroller) {
            _controller = webviewcontroller;

            log('onWebViewCreated: }');

            _controller.addJavaScriptHandler(
              handlerName: 'PaymentSuccess',
              callback: (args) {
                log('loaded PaymentSuccess: ${args.toString()}');

                _handlePaymentSuccess();
              },
            );
            _controller.addJavaScriptHandler(
              handlerName: 'PaymentFailed',
              callback: (args) {
                log('loaded PaymentFailed: ${args.toString()}');

                _handlePaymentFailure();
              },
            );
          },
        ),
      ),
    );
  }
}

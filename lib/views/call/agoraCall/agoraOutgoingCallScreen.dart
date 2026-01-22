import 'package:AstrowayCustomer/utils/global.dart';
import 'package:flutter/material.dart';

class Agoraoutgoingcallscreen extends StatefulWidget {
  final int callId;
  final String channel;
  final String token;

  const Agoraoutgoingcallscreen({
    required this.callId,
    required this.channel,
    required this.token,
  });

  @override
  _AgoraoutgoingcallscreenState createState() =>
      _AgoraoutgoingcallscreenState();
}

class _AgoraoutgoingcallscreenState extends State<Agoraoutgoingcallscreen> {
  @override
  void initState() {
    super.initState();
    pollStatus();
  }

  void pollStatus() async {
    while (true) {
      await Future.delayed(Duration(seconds: 2));
      final status = await apiHelper.getCallStatus(widget.callId);

      if (status == 'accepted') {
        // JOIN AGORA HERE
        break;
      }

      if (status == 'rejected') {
        Navigator.pop(context);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Calling...")),
    );
  }
}

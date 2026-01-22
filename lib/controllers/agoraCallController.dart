import 'dart:async';

import 'package:AstrowayCustomer/utils/global.dart';
import 'package:AstrowayCustomer/views/call/agoraCall/agoraIncomingCallScreen.dart';
import 'package:flutter/material.dart';

class Agoracallcontroller {
  Timer? timer;

  void listenIncomingCall(int userId, BuildContext context) {
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) async {
        final data = await apiHelper.checkIncomingCall(userId);
        if (data['hasCall'] == true) {
          timer?.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Agoraincomingcallscreen(
                  callId: data['call_id'],
                  channel: data['channel'],
                  token: data['token']),
            ),
          );
        }
      },
    );
  }

  void waitForAccept({
    required int callId,
    required VoidCallback onAccepted,
  }) {
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) async {
        final status = await apiHelper.getCallStatus(callId);
        if (status == 'accepted') {
          timer?.cancel();
          onAccepted();
        }
      },
    );
  }
}

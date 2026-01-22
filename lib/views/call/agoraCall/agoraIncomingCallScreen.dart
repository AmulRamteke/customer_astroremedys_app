import 'package:AstrowayCustomer/utils/global.dart';
import 'package:AstrowayCustomer/views/call/agoraCall/agoraInCallScreen.dart';
import 'package:flutter/material.dart';

class Agoraincomingcallscreen extends StatelessWidget {
  final int callId;
  final String channel;
  final String token;

  Agoraincomingcallscreen({
    required this.callId,
    required this.channel,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Incoming Call"),
          ElevatedButton(
            onPressed: () async {
              await apiHelper.updateCallStatus(callId, 'accepted');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => AgoraInCallScreen(
                    token: token,
                    channelName: channel,
                  ),
                ),
              );
              // JOIN AGORA
            },
            child: Text("Accept"),
          ),
          ElevatedButton(
            onPressed: () async {
              await apiHelper.updateCallStatus(callId, 'rejected');
              Navigator.pop(context);
            },
            child: Text("Reject"),
          ),
        ],
      ),
    );
  }
}

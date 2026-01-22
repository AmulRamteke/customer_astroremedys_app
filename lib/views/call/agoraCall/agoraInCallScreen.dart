import 'package:AstrowayCustomer/utils/services/agora_call_service.dart';
import 'package:flutter/material.dart';

class AgoraInCallScreen extends StatefulWidget {
  final String token;
  final String channelName;

  const AgoraInCallScreen({
    super.key,
    required this.token,
    required this.channelName,
  });

  @override
  State<AgoraInCallScreen> createState() => _AgoraInCallScreenState();
}

class _AgoraInCallScreenState extends State<AgoraInCallScreen> {
  final AgoraCallService _agoraService = AgoraCallService();

  @override
  void initState() {
    super.initState();
    startCall();
  }

  Future<void> startCall() async {
    await _agoraService.initAgora();
    await _agoraService.joinCall(
      token: widget.token,
      channelName: widget.channelName,
      uid: 0,
    );
  }

  @override
  void dispose() {
    _agoraService.endCall(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _agoraService.endCall(context);
          },
          child: const Text("End Call"),
        ),
      ),
    );
  }
}

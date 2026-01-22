import 'package:AstrowayCustomer/utils/config.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../views/callScreen.dart';

class AgoraCallService {
  late RtcEngine engine;

  Future<void> initAgora() async {
    await Permission.microphone.request();

    engine = createAgoraRtcEngine();
    await engine.initialize(
      RtcEngineContext(appId: agoraAppID),
    );
    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) {
          print("✅ Joined channel: ${connection.channelId}");
        },
        onUserJoined: (connection, remoteUid, elapsed) {
          print("🎧 Remote user joined: $remoteUid");
        },
        onUserOffline: (connection, remoteUid, reason) {
          print("❌ Remote user left: $remoteUid");
        },
        onError: (err, msg) {
          print("⛔ Agora Error: $err | $msg");
        },
      ),
    );
    await engine.enableAudio();
  }

  void registerEvents({
    required Function(int uid) onUserJoined,
    required Function(int uid) onUserLeft,
  }) {
    engine.registerEventHandler(
      RtcEngineEventHandler(
        onUserJoined: (_, uid, __) => onUserJoined(uid),
        onUserOffline: (_, uid, __) => onUserLeft(uid),
      ),
    );
  }

  Future<void> joinCall({
    required String token,
    required String channelName,
    required int uid,
  }) async {
    print("🔵 Joining channel: $channelName");
    print("🔵 Token length: ${token.length}");
    await engine.joinChannel(
      token: token,
      channelId: channelName,
      uid: uid,
      options: const ChannelMediaOptions(
        channelProfile: ChannelProfileType.channelProfileCommunication,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
    print("🟢 joinChannel() called");
  }

  Future<void> endCall(BuildContext context) async {
    try {
      print("📴 Ending call...");

      await engine.leaveChannel();
      await engine.release();

      print("✅ Call ended successfully");
    } catch (e) {
      print("⛔ Error ending call: $e");
    } finally {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => CallScreen(flag: 0),
          ),
        );
      }
    }
  }
}

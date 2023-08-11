import 'package:flutter_mute/flutter_mute.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final handleMuteProvider =
StateNotifierProvider<HandleMuteNotifier, bool>((ref) {
  return HandleMuteNotifier();
});

class HandleMuteNotifier extends StateNotifier<bool> {
  HandleMuteNotifier() : super(true);

  changeIsMuted(bool newValue) async{
    bool isAccessGranted = await FlutterMute.isNotificationPolicyAccessGranted;

    if (!isAccessGranted) {
      // Opens the notification settings to grant the access.
      await FlutterMute.openNotificationPolicySettings();
    }
    print(await FlutterMute.getRingerMode());
    await FlutterMute.setRingerMode(state ? RingerMode.Silent: RingerMode.Normal );
    print(await FlutterMute.getRingerMode());

    state = newValue;
  }
}

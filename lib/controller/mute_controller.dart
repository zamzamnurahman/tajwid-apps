import 'package:flutter_riverpod/flutter_riverpod.dart';

final handleMuteProvider =
    StateNotifierProvider<HandleMuteNotifier, bool>((ref) {
  return HandleMuteNotifier();
});

class HandleMuteNotifier extends StateNotifier<bool> {
  HandleMuteNotifier() : super(true);

  changeIsMuted(bool newValue) => state = newValue;
}

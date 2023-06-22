import 'package:flutter_riverpod/flutter_riverpod.dart';

final handleAnswerProvider =
    StateNotifierProvider<HandleAnswerNotifier, int>((ref) {
  return HandleAnswerNotifier();
});

class HandleAnswerNotifier extends StateNotifier<int> {
  HandleAnswerNotifier() : super(0);

  increment() => state = state + 20;

  clear() => state = 0;
}

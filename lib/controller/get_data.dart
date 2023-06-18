import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/materi.dart';

final getDataProvider =
    StateNotifierProvider<GetDataController, List<Materi>>((ref) {
  return GetDataController();
});

class GetDataController extends StateNotifier<List<Materi>> {
  GetDataController() : super([]);

  void getData() async {
    var json = await rootBundle.loadString("lib/data/materi.json");
    print(json);
    List result = jsonDecode(json)['Materi'];
    List<Materi> dataMateri = result.map((e) => Materi.fromJson(e)).toList();

    state = dataMateri;
  }
}

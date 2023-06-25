import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tajwid_apps/models/hukum_mad.dart';
import 'package:tajwid_apps/models/quiz.dart';

import '../models/materi.dart';

final getDataMateriProvider =
    StateNotifierProvider<GetDataMateriNotifier, List<Materi>>((ref) {
  return GetDataMateriNotifier();
});

class GetDataMateriNotifier extends StateNotifier<List<Materi>> {
  GetDataMateriNotifier() : super([]);

  void getDataMateri() async {
    var json = await rootBundle.loadString("lib/data/materi.json");
    print(json);
    List result = jsonDecode(json)['Materi'];
    List<Materi> dataMateri = result.map((e) => Materi.fromJson(e)).toList();

    state = dataMateri;
  }
}

///[GET DATA MATERI HUKUM MAD]

final getdataHukumMadProvider =
    StateNotifierProvider<GetDataHukumMadNotifier, List<HukumMad>>((ref) {
  return GetDataHukumMadNotifier();
});

class GetDataHukumMadNotifier extends StateNotifier<List<HukumMad>> {
  GetDataHukumMadNotifier() : super([]);

  void getDataMateri() async {
    var json = await rootBundle.loadString("lib/data/materi_hukum_mad.json");
    print(json);
    List result = jsonDecode(json)['data'];
    List<HukumMad> dataMateri =
        result.map((e) => HukumMad.fromJson(e)).toList();

    state = dataMateri;
  }
}

final getDataQuizProvider =
    StateNotifierProvider<GetDataQuizNotifier, List<Quiz>>((ref) {
  return GetDataQuizNotifier();
});

class GetDataQuizNotifier extends StateNotifier<List<Quiz>> {
  GetDataQuizNotifier() : super([]);

  void getDataQuiz() async {
    var json = await rootBundle.loadString("lib/data/quiz.json");
    print(json);
    List result = jsonDecode(json)['Quiz'];
    List<Quiz> data = result.map((e) => Quiz.fromJson(e)).toList();

    state = data;
  }
}

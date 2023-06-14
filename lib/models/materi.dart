import 'dart:convert';
import 'package:flutter/services.dart';

class Materi {
  String? title;
  List<Body>? body;

  Materi({this.title, this.body});

  Materi.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<List<Materi>> getData() async {
    var json = await rootBundle.loadString("lib/data/materi.json");
    print(json);
    List result = jsonDecode(json)['Materi'];
    List<Materi> dataMateri = result.map((e) => Materi.fromJson(e)).toList();

    return dataMateri;
  }
}

class Body {
  String? subTitle;
  String? description;

  Body({this.subTitle, this.description});

  Body.fromJson(Map<String, dynamic> json) {
    subTitle = json['sub_title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_title'] = subTitle;
    data['description'] = description;
    return data;
  }
}

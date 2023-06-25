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
}

class Body {
  String? subTitle;
  String? description;
  List<String>? contoh;
  String? sound;

  Body({this.subTitle, this.description, this.contoh, this.sound});

  Body.fromJson(Map<String, dynamic> json) {
    subTitle = json['sub_title'];
    description = json['description'];
    contoh = json['contoh'].cast<String>();
    sound = json['sound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_title'] = subTitle;
    data['description'] = description;
    data['contoh'] = contoh;
    data['sound'] = sound;
    return data;
  }
}

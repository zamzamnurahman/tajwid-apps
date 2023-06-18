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
  List<String>? contoh;
  String? description;

  Body({this.subTitle, this.contoh, this.description});

  Body.fromJson(Map<String, dynamic> json) {
    subTitle = json['sub_title'];
    if (json['contoh'] != null) {
      contoh = [];
      json['contoh'].forEach((v) {
        contoh!.add(v);
      });
    }
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_title'] = subTitle;
    data['contoh'] = contoh;
    data['description'] = description;
    return data;
  }
}

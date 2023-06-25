class HukumMad {
  String? title;
  String? deskripsi;
  Options? options;
  String? subtitle;
  String? example;

  HukumMad(
      {this.title, this.deskripsi, this.options, this.subtitle, this.example});

  HukumMad.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    deskripsi = json['deskripsi'];
    options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
    subtitle = json['subtitle'];
    example = json['example'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['deskripsi'] = deskripsi;
    if (options != null) {
      data['options'] = options!.toJson();
    }
    data['subtitle'] = subtitle;
    data['example'] = example;
    return data;
  }
}

class Options {
  String? description;
  List<String>? points;
  List<Subpoints>? subpoints;

  Options({this.description, this.points, this.subpoints});

  Options.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    points = json['points'].cast<String>();
    if (json['subpoints'] != null) {
      subpoints = <Subpoints>[];
      json['subpoints'].forEach((v) {
        subpoints!.add(Subpoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['points'] = points;
    if (subpoints != null) {
      data['subpoints'] = subpoints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subpoints {
  String? title;
  String? description;
  String? example;

  Subpoints({this.title, this.description, this.example});

  Subpoints.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    example = json['example'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['example'] = example;
    return data;
  }
}

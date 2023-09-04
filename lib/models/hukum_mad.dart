class HukumMad {
  String? title;
  String? deskripsi;
  Options? options;
  String? subtitle;
  String? example;
  String? audio;

  HukumMad(
      {this.title,
      this.deskripsi,
      this.options,
      this.subtitle,
      this.example,
      this.audio});

  HukumMad.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    deskripsi = json['deskripsi'];
    options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
    subtitle = json['subtitle'];
    example = json['example'];
    audio = json['audio'];
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
}

class Subpoints {
  String? title;
  String? description;
  String? example;
  String? audio;

  Subpoints({this.title, this.description, this.example, this.audio});

  Subpoints.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    example = json['example'];
    audio = json['audio'];
  }
}

class Quiz {
  String? title;
  List<Data>? data;

  Quiz({this.title, this.data});

  Quiz.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? description;
  int? asnwer;
  List<Options>? options;
  Media? media;

  Data({this.description, this.asnwer, this.options, this.media});

  Data.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    asnwer = json['asnwer'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['asnwer'] = asnwer;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class Options {
  String? option;
  String? status;

  Options({this.option, this.status});

  Options.fromJson(Map<String, dynamic> json) {
    option = json['option'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['option'] = option;
    data['status'] = status;
    return data;
  }
}

class Media {
  String? sound;
  String? image;

  Media({this.sound, this.image});

  Media.fromJson(Map<String, dynamic> json) {
    sound = json['sound'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sound'] = sound;
    data['image'] = image;
    return data;
  }
}

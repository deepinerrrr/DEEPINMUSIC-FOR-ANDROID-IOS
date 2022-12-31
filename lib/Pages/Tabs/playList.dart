class AutoGenerate {
  AutoGenerate({
    required this.hasTaste,
    required this.code,
    required this.category,
    required this.result,
  });
  late final bool hasTaste;
  late final int code;
  late final int category;
  late final List<Result> result;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    hasTaste = json['hasTaste'];
    code = json['code'];
    category = json['category'];
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hasTaste'] = hasTaste;
    _data['code'] = code;
    _data['category'] = category;
    _data['result'] = result.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Result {
  Result({
    required this.id,
    required this.type,
    required this.name,
    required this.copywriter,
    required this.picUrl,
    required this.canDislike,
    required this.trackNumberUpdateTime,
    required this.playCount,
    required this.trackCount,
    required this.highQuality,
    required this.alg,
  });
  late final int id;
  late final int type;
  late final String name;
  late final String copywriter;
  late final String picUrl;
  late final bool canDislike;
  late final int trackNumberUpdateTime;
  late final int playCount;
  late final int trackCount;
  late final bool highQuality;
  late final String alg;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    copywriter = json['copywriter'];
    picUrl = json['picUrl'];
    canDislike = json['canDislike'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    playCount = json['playCount'];
    trackCount = json['trackCount'];
    highQuality = json['highQuality'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['name'] = name;
    _data['copywriter'] = copywriter;
    _data['picUrl'] = picUrl;
    _data['canDislike'] = canDislike;
    _data['trackNumberUpdateTime'] = trackNumberUpdateTime;
    _data['playCount'] = playCount;
    _data['trackCount'] = trackCount;
    _data['highQuality'] = highQuality;
    _data['alg'] = alg;
    return _data;
  }
}

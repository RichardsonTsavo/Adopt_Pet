import 'dart:convert';

class WeightAndHeightModel {
  final String? imperial;
  final String? metric;

  WeightAndHeightModel({
    this.imperial,
    this.metric,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (imperial != null) {
      map["imperial"] = imperial;
    }
    if (metric != null) {
      map["metric"] = metric;
    }
    return map;
  }

  factory WeightAndHeightModel.fromMap(Map<String, dynamic> map) {
    return WeightAndHeightModel(
      imperial: map['imperial'],
      metric: map['metric'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightAndHeightModel.fromJson(String source) =>
      WeightAndHeightModel.fromMap(json.decode(source));
}

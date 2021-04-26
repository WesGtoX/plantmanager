import 'dart:convert';

class PlantWaterFrequencieModel {
  final String key;
  final String title;

  PlantWaterFrequencieModel({
    this.key,
    this.title
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'title': title
    };
  }

  factory PlantWaterFrequencieModel.fromMap(Map<String, dynamic> map) {
    return PlantWaterFrequencieModel(
      key: map['key'],
      title: map['title']
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantWaterFrequencieModel.fromJson(String source) => PlantWaterFrequencieModel.fromMap(json.decode(source));
}

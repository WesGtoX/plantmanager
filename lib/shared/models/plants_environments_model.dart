import 'dart:convert';

class PlantEnvironmentModel {
  final String key;
  final String title;

  PlantEnvironmentModel({
    required this.key,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'title': title,
    };
  }

  factory PlantEnvironmentModel.fromMap(Map<String, dynamic> map) {
    return PlantEnvironmentModel(
      key: map['key'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantEnvironmentModel.fromJson(String source) => PlantEnvironmentModel.fromMap(json.decode(source));
}

import 'dart:convert';

class PlantModel {
  final String id;
  final String name;
  final String about;
  final String waterTips;
  final String photo;
  final List environments;
  final String frequency;

  PlantModel({
    required this.id,
    required this.name,
    required this.about,
    required this.waterTips,
    required this.photo,
    required this.environments,
    required this.frequency
  });

factory PlantModel.fromDB(Map<String, dynamic> map, String id) {
    return PlantModel(
      id: id,
      name: map['name'],
      about: map['about'],
      waterTips: map['water_tips'],
      photo: map['photo'],
      environments: map['environments'],
      frequency: map['frequency'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'waterTips': waterTips,
      'photo': photo,
      'environments': environments,
      'frequency': frequency
    };
  }

  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
      id: map['id'],
      name: map['name'],
      about: map['about'],
      waterTips: map['water_tips'],
      photo: map['photo'],
      environments: map['environments'],
      frequency: map['frequency'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantModel.fromJson(String source) => PlantModel.fromMap(json.decode(source));
}

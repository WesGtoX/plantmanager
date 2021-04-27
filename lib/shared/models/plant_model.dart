import 'dart:convert';

class PlantModel {
  final int id;
  final String name;
  final String about;
  final String waterTips;
  final String photo;
  final List environments;
  final String frequency;

  PlantModel({
    this.id,
    this.name,
    this.about,
    this.waterTips,
    this.photo,
    this.environments,
    this.frequency
  });

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

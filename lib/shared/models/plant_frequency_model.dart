import 'dart:convert';

class FrequencyModel {
  final int times;
  final String repeatEvery;

  FrequencyModel({
    required this.times,
    required this.repeatEvery,
  });

  Map<String, dynamic> toMap() {
    return {
      'times': times,
      'repeatEvery': repeatEvery,
    };
  }

  factory FrequencyModel.fromMap(Map<String, dynamic> map) {
    return FrequencyModel(
      times: map['times'],
      repeatEvery: map['repeatEvery'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FrequencyModel.fromJson(String source) => FrequencyModel.fromMap(json.decode(source));
}

import 'dart:convert';
import 'package:plantmanager/shared/models/plant_model.dart';
// import 'package:plantmanager/shared/models/plants_water_frequencies_model.dart';
// import 'package:plantmanager/shared/models/plants_environments_model.dart';

class DataModel {
  // final List<PlantWaterFrequencieModel> plantsWaterFrequencies;
  // final List<PlantEnvironmentModel> plantsEnvironments;
  final List<PlantModel> plants;

  DataModel({
    // this.plantsWaterFrequencies,
    // this.plantsEnvironments,
    required this.plants,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'plantsWaterFrequencies': plantsWaterFrequencies.map((x) => x.toMap()).toList(),
      // 'plantsEnvironments': plantsEnvironments.map((x) => x.toMap()).toList(),
      'plants': plants.map((x) => x.toMap()).toList(),
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      // plantsWaterFrequencies: List<PlantWaterFrequencieModel>.from(map['plantsWaterFrequencies']?.map((x) => PlantWaterFrequencieModel.fromMap(x))),
      // plantsEnvironments: List<PlantEnvironmentModel>.from(map['plantsEnvironments']?.map((x) => PlantEnvironmentModel.fromMap(x))),
      plants: List<PlantModel>.from(map['plants']?.map((x) => PlantModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source));
}

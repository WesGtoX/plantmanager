// import 'dart:convert';

import 'package:plantmanager/shared/models/data_model.dart';
import 'package:plantmanager/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async{
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }
  Future<DataModel> getData() async{
    final response = await rootBundle.loadString("assets/database/plants.json");
    final data = DataModel.fromJson(response);
    return data;
  }
  // Future<List<DataModel>> getPlants() async{
  //   final response = await rootBundle.loadString("assets/database/plants.json");
  //   final list = jsonDecode(response) as List;
  //   final plantData = list.map((e) => DataModel.fromMap(e)).toList();
  //   return plantData;
  // }
}
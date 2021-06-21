
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantmanager/screens/Home/home_repository.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/shared/models/plant_model.dart';
import 'package:plantmanager/shared/models/data_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  // late final UserModel user;
  late final DataModel data;

  final repository = HomeRepository();

  // void getUser() async{
  //   state = HomeState.loading;
  //   user = await repository.getUser();
  //   state = HomeState.sucess;
  // }

  void getData() async {
    //Initialize datamodel
    var db = FirebaseFirestore.instance;

    //Load data from database
    var snapshots = await db.collection('plants').get();

    data = new DataModel(
        plants: snapshots.docs
            .map((e) => PlantModel.fromDB(e.data(), e.id))
            .toList());

    state = HomeState.loading;
    state = HomeState.sucess;
  }
}

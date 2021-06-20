import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantmanager/screens/Home/home_repository.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/shared/models/plant_model.dart';
import 'package:plantmanager/shared/models/user_model.dart';
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
    data = new DataModel(plants: <PlantModel>[]);

    //Access database and get all plants
    FirebaseFirestore.instance.collection('plants').snapshots().asyncMap(
        (result) => result.docs.forEach((doc) =>
            data.plants.add(new PlantModel.fromDB(doc.data(), doc.id))));

    state = HomeState.loading;
    // data = await repository.getData();
    state = HomeState.sucess;
  }
}

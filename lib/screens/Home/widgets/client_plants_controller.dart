import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/shared/models/client_plant.dart';
import 'package:flutter/foundation.dart';

class ClientPlantsController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  late final String userId;
  late final List<ClientPlant> plants;

  void delete(String id) {
    var db = FirebaseFirestore.instance;

    db.collection('clientsPlants').doc(id).delete();
  }

  void update(String? id, String alarm) {
    var db = FirebaseFirestore.instance;

    db.collection('clientsPlants').doc(id).update({
      'txtAlarm': alarm,
    });
  }

  void getData() async {
    var db = FirebaseFirestore.instance;

    await db.collection('clientsPlants')
      .where('userId', isEqualTo: this.userId)
      .get().then((value) => {
        this.plants = value.docs.map((e) => ClientPlant.fromMap(
          e.data(), e.id
        )).toList()
      }).catchError((error) {
      state = HomeState.error;
      print(error);
    });

    state = HomeState.loading;
    state = plants.length > 0 ? HomeState.sucess : HomeState.empty;
  }
}

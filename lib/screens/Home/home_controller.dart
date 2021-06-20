import 'package:plantmanager/screens/Home/home_repository.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/shared/models/user_model.dart';
import 'package:plantmanager/shared/models/data_model.dart';
import 'package:flutter/foundation.dart';


class HomeController{
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  
  late final UserModel user;
  late final DataModel data;

  final repository = HomeRepository();

  void getUser() async{
    state = HomeState.loading;    
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getData() async{
    state = HomeState.loading;
    data = await repository.getData();
    state = HomeState.sucess;
  }
}
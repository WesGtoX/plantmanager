import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_controller.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/screens/Home/widgets/app_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/app_bottom_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/plants_list_view_widget.dart';

class ListPlants extends StatefulWidget {
  ListPlants({ Key key }) : super(key: key);

  @override
  _ListPlantsState createState() => _ListPlantsState();
}

class _ListPlantsState extends State<ListPlants> {
  final controller = HomeController();
  String txtReminderAlarm = "Regue sua Aningapara daqui a 2 horas";

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(text1: 'Minhas\n', text2: 'Plantinhas', image: controller.user.photo),
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.retangleLightColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 30, left: 32, right: 32),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(AppImages.waterdrop),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: 250,
                        child: Text(txtReminderAlarm,
                            style: AppTextStyles.textRetangle),
                      ),
                    ],
                  ),
                ),
              ),
              
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    width: MediaQuery.of(context).size.width,
                    child: Text("Próximas regadas", style: AppTextStyles.bodySemiBold, textAlign: TextAlign.left),
                  ),
                ],
              ),
              
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return PlantsListViewWidget(
                        name: controller.data.plants[index].name, 
                        imageUri: controller.data.plants[index].photo,
                        alarm: controller.data.plants[index].frequency
                      );
                    },
                    itemCount: controller.data.plants.length,
                  ),
                ),
              ),
              
              // BottomBarWidget(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AppBottomBarWidget(
          fabLocation: FloatingActionButtonLocation.centerDocked,
          shape: const CircularNotchedRectangle(),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.greenDarkColor),
          )
        )
      );
    }
  }
}

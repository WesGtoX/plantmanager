import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/screens/Home/widgets/app_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/app_bottom_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/client_plants_controller.dart';
import 'package:plantmanager/screens/Home/widgets/plants_list_view_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListPlants extends StatefulWidget {
  final String userId;
  final String userName;

  ListPlants({Key? key, required this.userId, required this.userName})
      : super(key: key);

  @override
  _ListPlantsState createState() =>
      _ListPlantsState(this.userId, this.userName);
}

class _ListPlantsState extends State<ListPlants> with TickerProviderStateMixin {
  final controller = ClientPlantsController();
  late String txtReminderAlarm = "Regue sua Aningapara daqui a 2 horas";
  late String userId;
  late String userName;
  late AnimationController circularIndicator;

  _ListPlantsState(this.userId, this.userName);

  @override
  void initState() {
    super.initState();
    controller.userId = this.userId;
    controller.getData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    circularIndicator = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    circularIndicator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
            text1: 'Minhas\n',
            text2: 'Plantinhas',
            image:
                'https://cdn2.iconfinder.com/data/icons/user-interface-line-38/24/Untitled-5-19-512.png'), //controller.user.photo),
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
                    child: Text("Próximas regadas",
                        style: AppTextStyles.bodySemiBold,
                        textAlign: TextAlign.left),
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
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.30,
                          child: Container(
                            color: Colors.white,
                            child: ListTile(
                              title: PlantsListViewWidget(
                                  name: controller.plants[index].name,
                                  imageUri: controller.plants[index].imageUri,
                                  alarm: controller.plants[index].txtAlarm
                              ), 
                            )
                          ),
                          secondaryActions: [
                            SlideAction(
                              child: 
                              Container(
                                width: 148,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.shapeColor
                                ),
                                child: IconButton(
                                    color: Colors.red,
                                    icon: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children:[Icon(Icons.delete)]),
                                        Row(mainAxisAlignment: MainAxisAlignment.center, children:[Text("Remover")])
                                      ]
                                    ),
                                    onPressed: () => {
                                      controller.delete(controller.plants[index].id),
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListPlants(userId: this.userId, userName: this.userName)))
                                    },
                                  )
                              )
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: controller.plants.length,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text("Quantidade de plantas ${controller.plants.length}",
                    style: AppTextStyles.textBold, textAlign: TextAlign.end),
              )

              // BottomBarWidget(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AppBottomBarWidget(
          userId: this.userId,
          userName: this.userName,
          fabLocation: FloatingActionButtonLocation.centerDocked,
          shape: const CircularNotchedRectangle(),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          children: [
            Center(
                child: CircularProgressIndicator(
              value: circularIndicator.value,
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.greenDarkColor),
            )),
            Container(
              color: AppColors.backgroundColor,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.shapeColor,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              child: Icon(
                                Icons.ballot_outlined,
                                size: 80,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 50),
                          child: Text(
                            "Você não possui nenhuma plantinha ainda",
                            style: AppTextStyles.text,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AppBottomBarWidget(
          userId: this.userId,
          userName: this.userName,
          fabLocation: FloatingActionButtonLocation.centerDocked,
          shape: const CircularNotchedRectangle(),
        ),
      );
    }
  }
}

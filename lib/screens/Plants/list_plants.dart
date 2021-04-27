import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_controller.dart';
import 'package:plantmanager/screens/Home/widgets/app_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/plants_list_view_widget.dart';
import 'package:plantmanager/shared/models/plant_model.dart';

class ListPlants extends StatefulWidget {
  ListPlants({Key key}) : super(key: key);

  @override
  _ListPlantsState createState() => _ListPlantsState();
}

class _ListPlantsState extends State<ListPlants> {
  final controller = HomeController();
  String txtReminderAlarm = "Regue sua Aningapara daqui a 2 horas";
  List<PlantModel> listPlants = [];

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    listPlants.add(
      new PlantModel(
          about:
              "Adapta-se tanto ao sol e sombra, mas prefere ficar num cantinho fresco, sem sol direto. ",
          environments: ["bedroom"],
          frequency: DateTime.now(),
          id: 3,
          name: "Peperomia",
          photo:
              "https://storage.googleapis.com/golden-wind/nextlevelweek/05-plantmanager/3.svg"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          text1: 'Minhas\n',
          text2: 'Plantinhas\n',
          image: controller.user.photo),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: Image.asset('assets/images/waterdrop.png'),
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
                  child: Text(
                    "Próximas regadas",
                    style: AppTextStyles.bodySemiBold,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16, left: 32, right: 32),
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return PlantsListViewWidget(
                    imageUri: listPlants[index].photo,
                    label: listPlants[index].name,
                    alarm: listPlants[index].frequency,
                  );
                },
                itemCount: listPlants.length,
              ),
            ),
            AppBar(
              backgroundColor: AppColors.backgroundColor,
              shadowColor: AppColors.shapeColor,
              elevation: 100.0,
              actions: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        icon: Container(
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 2, color: AppColors.bodyLightColor),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.bodyLightColor,
                            size: 18,
                          ),
                        ),
                        label: Text(
                          "Nova planta",
                          style: GoogleFonts.roboto(
                            color: AppColors.bodyLightColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        onPressed: () {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Planta adicionada com sucesso.'),
                              duration: Duration(seconds: 2),
                            ));
                          });
                        },
                      ),
                      TextButton.icon(
                        icon: Icon(
                          Icons.list,
                          color: AppColors.greenColor,
                          size: 25,
                        ),
                        label: Text(
                          "Minhas plantinhas",
                          style: GoogleFonts.roboto(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_controller.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/screens/Home/widgets/app_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/plants_environments_widget.dart';
import 'package:plantmanager/screens/Home/widgets/plants_list_widget.dart';

class Home extends StatefulWidget {
  Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final controller = HomeController();
  var plantEnvirement = [];
  
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getData();
    controller.stateNotifier.addListener(() { 
      setState(() {});
    });
    plantEnvirement.add('Banheiro');
    plantEnvirement.add('Copa');
    plantEnvirement.add('Cozinha');
    plantEnvirement.add('Garagem');
    plantEnvirement.add('Quarto');
    plantEnvirement.add('Quintal');
    plantEnvirement.add('Sala');
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          text1: 'Olá,\n', 
          text2: controller.user.name, 
          image: controller.user.photo
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.00,
                margin: EdgeInsets.only(top: 32, bottom: 24),
                child: Text.rich(
                  TextSpan(
                    text: 'Em qual hambiente,\n', style: AppTextStyles.textMedium,
                    children: [
                      TextSpan(text: 'você quer colocar sua planta?', style: AppTextStyles.text)
                    ]
                  ),
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 16),
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PlantsEnvironmentsWidget(label: plantEnvirement[index]);
                  },
                  itemCount: plantEnvirement.length,
                ),
              ),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.00,
                  height: 40,
                  margin: EdgeInsets.only(top: 32),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: controller.data.plants.map(
                      (e) => PlantsListWidget(label: e.name, imageUri: e.photo)
                    ).toList(),
                  ),
                ),
              ),

            ],
          ),
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

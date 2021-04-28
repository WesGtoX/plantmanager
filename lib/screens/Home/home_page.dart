import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/CreateUpdate/create_update_page.dart';
import 'package:plantmanager/screens/Home/home_controller.dart';
import 'package:plantmanager/screens/Home/home_state.dart';
import 'package:plantmanager/screens/Home/widgets/app_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/app_bottom_bar_widget.dart';
import 'package:plantmanager/screens/Home/widgets/plants_environments_widget.dart';
import 'package:plantmanager/screens/Home/widgets/plants_list_widget.dart';

class Home extends StatefulWidget {
  final String username;
  final String name;
  
  Home({ Key key, this.username, this.name }) : super(key: key);

  @override
  _HomeState createState() => _HomeState(this.username, this.name);
}

class _HomeState extends State<Home> {
  
  final controller = HomeController();
  String username;
  String name;
  String photo;
  
  _HomeState(this.username, this.name);
  
  var plantEnvirement = [];
  
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getData();
    controller.stateNotifier.addListener(() { 
      setState(() {});
    });

    if (username == 'quemuel') {
      name = 'Quemuel Nassor';
      photo = 'https://avatars.githubusercontent.com/u/41460212';
    } else if (name != null && name.length != 0) {
      photo = 'https://i.imgur.com/FfLAjmz.png';
    }
    
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
          text2: name == null ? controller.user.name : name, 
          image: photo == null ? controller.user.photo : photo, 
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
                    text: 'Em qual ambiente,\n', style: AppTextStyles.textMedium,
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
                      (e) => PlantsListWidget(
                        name: e.name, 
                        imageUri: e.photo,
                        about: e.about,
                        waterTips: e.waterTips
                      )
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), 
          tooltip: "Nova Planta",
          backgroundColor: AppColors.greenDarkColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrEditWidget(
                name: 'Aningapara',
                imageUri: 'https://i.imgur.com/jOHlIRa.png',
                about: 'É uma espécie tropical que tem crescimento rápido e fácil manuseio.',
                waterTips: 'Mantenha a terra sempre húmida sem encharcar. Regue 2 vezes na semana.',
                buttonText: 'Cadastrar planta',
            )));
          }, 
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

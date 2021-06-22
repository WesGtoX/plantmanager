import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/screens/CreateUpdate/widgets/number_picker.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Feedback/feedback_crud_page.dart';
import 'package:plantmanager/screens/Home/widgets/client_plants_controller.dart';
import 'package:plantmanager/shared/models/client_plant.dart';

class CreateOrEditWidget extends StatefulWidget {
  final String userId;
  final String userName;
  final String imageUri;
  final String name;
  final String about;
  final String waterTips;
  final String buttonText;
  late String? plantId = '';

  CreateOrEditWidget({
    Key? key,
    required this.userId,
    required this.userName,
    required this.imageUri,
    required this.name,
    required this.about,
    required this.waterTips,
    required this.buttonText,
    this.plantId
  }) : super(key: key);

  @override
  _CreateOrEditWidgetState createState() => _CreateOrEditWidgetState(
    this.userId,
    this.userName,
    this.imageUri,
    this.name,
    this.about,
    this.waterTips,
    this.buttonText,
    this.plantId
  );
}

class _CreateOrEditWidgetState extends State<CreateOrEditWidget> {
  final controller = ClientPlantsController();
  late String userId;
  late String userName;
  late String imageUri;
  late String name;
  late String about;
  late String waterTips;
  late String buttonText;
  late String txtAlarm = "";
  late String? plantId;

  _CreateOrEditWidgetState(
    this.userId, 
    this.userName, 
    this.imageUri, 
    this.name, 
    this.about, 
    this.waterTips, 
    this.buttonText,
    this.plantId
  );

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context, 
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: AppColors.shapeColor,
                padding: EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Image.network(imageUri, height: 176)
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Text(name, style: AppTextStyles.titleSemiBold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 430,
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 60,
                          ),
                          child: Text(about, style: AppTextStyles.text, textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.retangleLightColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(AppImages.waterdrop),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: 250,
                            child: Text(waterTips, style: AppTextStyles.textRetangle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Text("Escolha o melhor horário para ser lembrado:", style: AppTextStyles.smallText),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          margin: EdgeInsets.symmetric(vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: _selectTime,
                                child: Text('Selecionar Hora'),
                                style: ButtonStyle(
                                  // overlayColor: ,
                                  backgroundColor: MaterialStateProperty.all(AppColors.greenDarkColor),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Hora selecionada: ${_time.format(context)}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 93, vertical: 16),
                    margin: EdgeInsets.only(bottom: 39),
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: TextButton(
                      child: Text(
                        buttonText,
                        style: GoogleFonts.roboto(
                          color: AppColors.shapeColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      onPressed: () {
                        if (this.plantId == null) {
                          // Registering data on database
                          db.collection('clientsPlants').add(
                            ClientPlant(
                              about: this.about,
                              imageUri: this.imageUri,
                              name: this.name,
                              userId: this.userId,
                              waterTips: this.waterTips,
                              txtAlarm: _time.format(context)
                            ).toMap()
                          );
                        } else {
                          controller.update(this.plantId, _time.format(context));
                        }

                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => FeedbackWidget(
                            userId: this.userId, 
                            userName: this.userName,
                          ),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

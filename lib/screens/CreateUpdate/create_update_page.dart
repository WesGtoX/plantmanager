import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/screens/CreateUpdate/widgets/number_picker.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Feedback/feedback_crud_page.dart';

class CreateOrEditWidget extends StatefulWidget {
  final String imageUri;
  final String name;
  final String about;
  final String waterTips;
  final String buttonText;

  CreateOrEditWidget({
    Key? key,
      required this.imageUri,
      required this.name,
      required this.about,
      required this.waterTips,
      required this.buttonText
    }) : super(key: key);

  @override
  _CreateOrEditWidgetState createState() => _CreateOrEditWidgetState(
    this.imageUri, 
    this.name, 
    this.about, 
    this.waterTips, 
    this.buttonText
  );
}

class _CreateOrEditWidgetState extends State<CreateOrEditWidget> {

  String imageUri;
  String name;
  String about;
  String waterTips;
  String buttonText;
  String txtAlarm = "";

  _CreateOrEditWidgetState(this.imageUri, this.name, this.about, this.waterTips, this.buttonText);

  var hora = InputNumberPicker(14, 1, 23);
  var min = InputNumberPicker(30, 1, 59);
  var sec = InputNumberPicker(14, 1, 59);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
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
                      Text("Ecolha o melhor horário para ser lembrado:", style: AppTextStyles.smallText),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [hora, min, sec],
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
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackWidget(),
                        ),
                      );
                    },
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

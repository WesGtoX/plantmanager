import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/screens/CreateUpdate/widgets/number_picker.dart';
import 'package:plantmanager/core/core.dart';

class CreateOrEditWidget extends StatefulWidget {
  @override
  _CreateOrEditWidgetState createState() => _CreateOrEditWidgetState();
}

class _CreateOrEditWidgetState extends State<CreateOrEditWidget> {
  // Parameters to create an plant ou view details of an existing
  final String txtImageUrl = 'https://storage.googleapis.com/golden-wind/nextlevelweek/05-plantmanager/5.svg';
  String txtName = 'Peperomia';
  String txtCareObservations = 'Não pode pegar sol e deve ficar em temperatura ambiente, dentro de casa.';
  String txtReminderAlarm = 'A rega deve ser feita com 400ml a cada dois dias';
  String txtAlarm = "";
  String saveButtonText = "Cadastrar planta";

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
                        // width: 100,
                        // height: 100,
                        margin: EdgeInsets.only(top: 50),
                        child: SvgPicture.network(txtImageUrl, height: 176),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          txtName,
                          style: AppTextStyles.titleSemiBold,
                        ),
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
                        child: Text(txtCareObservations, style: AppTextStyles.text, textAlign: TextAlign.center),
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
                          child: Image.asset('assets/images/waterdrop.png'),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: 250,
                          child: Text(txtReminderAlarm,style: AppTextStyles.textRetangle),
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
                      saveButtonText,
                      style: GoogleFonts.roboto(
                        color: AppColors.shapeColor, 
                        fontSize: 17, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
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

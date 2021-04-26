import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plantmanager/core/components/number_picker.dart';
import 'package:plantmanager/core/core.dart';

class CreateOrEditWidget extends StatefulWidget {
  @override
  _CreateOrEditWidgetState createState() => _CreateOrEditWidgetState();
}

class _CreateOrEditWidgetState extends State<CreateOrEditWidget> {
  ///Parameters to create an plant ou view details of an existing
  final String txtImageUrl =
      'https://storage.googleapis.com/golden-wind/nextlevelweek/05-plantmanager/3.svg';
  String txtName = 'Peperomia';
  String txtCareObservations =
      'Não pode pegar sol e deve ficar em temperatura ambiente, dentro de casa';
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
                        width: 100,
                        height: 100,
                        child:
                            Image.network('https://picsum.photos/250?image=9'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          txtName,
                          style: AppTextStyles.headingSmall,
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
                        child: Text(
                          txtCareObservations,
                          style: AppTextStyles.textLarge,
                        ),
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
                          child: Image.asset('images/waterdrop.png'),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: 250,
                          child: Text(
                            txtReminderAlarm,
                            style: AppTextStyles.textRetangle,
                          ),
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
                      Text(
                        "Ecolha o melhor horário para ser lembrado:",
                        style: AppTextStyles.complement,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            hora,
                            min,
                            sec,
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: TextButton(
                    child: Text(
                      saveButtonText,
                      style: AppTextStyles.textLargeLight,
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

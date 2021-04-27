import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/core.dart';

class FeedbackStartWidget extends StatelessWidget {
  String _icon = "images/icons/emoji-smile.png";
  String _title = "Prontinho";
  String _message ="Agora vamos começar a cuidar das suas plantinhas com muito cuidado.";
  String _buttonName = "Começar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(_icon),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    _title,
                    style: AppTextStyles.titleSemiBold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      _message,
                      style: AppTextStyles.text,
                      textAlign: TextAlign.center,
                    ),
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
                      _buttonName,
                      style: GoogleFonts.roboto(
                          color: AppColors.shapeColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
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

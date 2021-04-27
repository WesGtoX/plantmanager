import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Login/login_page.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(60),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Gerencie suas plantas de forma fácil', style: AppTextStyles.titleSemiBold, textAlign: TextAlign.center),
            Image.asset(AppImages.watering),
            Text('Não esqueça mais de regar suas plantas. Nós cuidamos de lembrar você sempre que precisar.', style: AppTextStyles.body, textAlign: TextAlign.center),
            
            MaterialButton(
              height: 56,
              minWidth: 56,
              color: AppColors.greenColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Icon(
                Icons.chevron_right,
                size: 32,
                color: AppColors.shapeColor,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

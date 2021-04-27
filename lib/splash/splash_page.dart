import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Start/start_page.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Start()
      ))
    });
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.backgroundColor),
        child: Center(
          child: Image.asset(AppImages.adaptiveIcon),
        ) 
      ),
    );
  }
}

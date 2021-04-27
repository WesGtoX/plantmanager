import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:flutter/cupertino.dart';

class AppBarWidget extends PreferredSize {
  final String text1;
  final String text2;
  final String image;

  AppBarWidget({@required this.text1, @required this.text2, this.image }) : super(
    preferredSize: Size.fromHeight(150),
    child: Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: text1, style: AppTextStyles.titleLight,
              children: [
                TextSpan(text: text2, style: AppTextStyles.titleBold)
              ]
            ),
          ),
          Container(
            height: 56, 
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), 
              image: DecorationImage(
                image: NetworkImage(image)
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

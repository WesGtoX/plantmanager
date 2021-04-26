import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({ @required this.user }) : super(
    preferredSize: Size.fromHeight(150),
    child: Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'Olá,\n', style: AppTextStyles.titleLight,
              children: [
                TextSpan(text: user.name, style: AppTextStyles.titleBold)
              ]
            ),
          ),
          Container(
            height: 56, 
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), 
              image: DecorationImage(
                image: NetworkImage(user.photo)
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

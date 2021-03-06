import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/CreateUpdate/create_update_page.dart';

class PlantsListWidget extends StatelessWidget {
  final String userId;
  final String userName;
  final String imageUri;
  final String name;
  final String about;
  final String waterTips;

  const PlantsListWidget({
    Key? key,
    required this.userId,
    required this.userName,
    required this.imageUri,
    required this.name,
    required this.about,
    required this.waterTips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: 148,
          height: 154,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.shapeColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Image.network(imageUri, height: 90)
              ),
              Text(name, style: AppTextStyles.smallText, textAlign: TextAlign.left),
            ],
          )
        ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrEditWidget(
          userId: userId,
          userName: this.userName,
          imageUri: imageUri,
          name: name,
          about: about,
          waterTips: waterTips,
          buttonText: 'Cadastrar planta',
        )));
      },
    );
  }
}

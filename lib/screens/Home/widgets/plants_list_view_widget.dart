import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';

class PlantsListViewWidget extends StatelessWidget {
  
  final String name;
  final String imageUri;
  final String alarm;
  
  const PlantsListViewWidget({
    Key key, 
    this.name, 
    this.imageUri, 
    this.alarm
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 148,
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.shapeColor
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 21),
              child: Image.network(imageUri)
            ),
            Text(name,
              style: AppTextStyles.textMedium,
              textAlign: TextAlign.left,
            ),
            Text.rich(
              TextSpan(
                text: "Regar às\n",
                style: AppTextStyles.smallText,
                children: [
                  TextSpan(
                    text: alarm,
                    style: AppTextStyles.smallTextMedium,
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

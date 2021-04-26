import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantmanager/core/core.dart';

class PlantsListWidget extends StatelessWidget {
  final String imageUri;
  final String label;
  const PlantsListWidget({ Key key, this.imageUri, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 154,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: AppColors.shapeColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: SvgPicture.network(imageUri, height: 90)
          ),
          Text(label, style: AppTextStyles.smallText, textAlign: TextAlign.left),
        ],
      )
    );
  }
}

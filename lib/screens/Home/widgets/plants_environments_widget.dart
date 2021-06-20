import 'package:flutter/material.dart';
import 'package:plantmanager/core/app_colors.dart';
import 'package:plantmanager/core/core.dart';

class PlantsEnvironmentsWidget extends StatelessWidget {
  final String label;
  const PlantsEnvironmentsWidget({ Key? key, required this.label }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      width: 76,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.shapeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Center(
          child: Text(
            label, 
            style: AppTextStyles.smallText,
            textAlign: TextAlign.left
          ),
        ),
      ),
    );
  }
}

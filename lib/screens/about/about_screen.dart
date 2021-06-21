// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/widgets/app_bottom_bar_widget.dart';

class About extends StatefulWidget {
  final String userId;
  final String userName;

  About({Key? key, required this.userId, required this.userName})
      : super(key: key);

  @override
  _AboutState createState() => _AboutState(this.userId, this.userName);
}

class _AboutState extends State<About> {
  late String userId;
  late String userName;
  
  _AboutState(this.userId, this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.shapeColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                        child: Icon(
                          Icons.developer_mode,
                          size: 80,
                        ),
                      ),
                      Text(
                        "Desenvolvedores:\n",
                        style: AppTextStyles.bodyMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: 
                              EdgeInsets.only(left: 80, right: 15, bottom: 10),
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://avatars.githubusercontent.com/u/32619183")),
                            ),
                          ),
                          Text("Wesley Mendes - 828507",
                              style: AppTextStyles.text),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: 
                              EdgeInsets.only(left: 80, right: 15, bottom: 10),
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://avatars.githubusercontent.com/u/41460212")),
                            ),
                          ),
                          Text(
                            "Quemuel Nassor - 828461",
                            style: AppTextStyles.text,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Text(
                    "Informações:\n",
                    style: AppTextStyles.bodyMedium,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    child: Text(
                      "O PlantManager foi feito para quem gosta de plantas e quer vê-las sempre verdinhas e bonitas, com ele suas plantas estarão sempre com a quantidade ideal de água e luz do jeitinho que elas merecem, desenvolvido em Flutter com o que há de melhor do Material Design",
                      style: AppTextStyles.text,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomBarWidget(
        userId: this.userId,
        userName: this.userName,
        fabLocation: FloatingActionButtonLocation.centerDocked,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}

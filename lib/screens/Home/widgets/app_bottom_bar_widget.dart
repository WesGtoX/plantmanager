import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_list_plants.dart';
import 'package:plantmanager/screens/Home/home_page.dart';
import 'package:plantmanager/screens/about/about_screen.dart';

class AppBottomBarWidget extends StatelessWidget {
  final String userId;
  final String userName;

  const AppBottomBarWidget({
    required this.userId,
    required this.userName,
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;

  static final List<FloatingActionButtonLocation> centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: AppColors.greenDarkColor,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Home', 
              icon: const Icon(Icons.menu), 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Home(
                    userId: this.userId, 
                    userName: this.userName
                  ))
                );
              }
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Sobre', 
              icon: const Icon(Icons.people), 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => About(
                    userId: this.userId,
                    userName: this.userName
                  ))
                );
              }
            ),
            IconButton(
              tooltip: 'Minhas Plantinhas', 
              icon: const Icon(Icons.list), 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ListPlants(
                    userId: this.userId, 
                    userName: this.userName,
                  ))
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

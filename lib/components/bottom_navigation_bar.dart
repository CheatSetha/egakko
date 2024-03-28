
import 'package:egakko/core/cors.dart';
import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Course',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Article',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Profile',
        ),
      ]
      ,

          

      selectedItemColor: AppColors.secondaryColor,
      unselectedItemColor: Colors.black26,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
    );
      
  }
}


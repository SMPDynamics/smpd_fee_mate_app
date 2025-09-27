import 'package:flutter/material.dart';
import 'package:smpd_fee_mate_app/core/utils/app_colors.dart';

// App footer
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.dividerColor,
      backgroundColor: AppColors.white,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Sessions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'Payments',
        ),
      ],
    );
  }
}

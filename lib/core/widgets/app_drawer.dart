import 'package:flutter/material.dart';
import 'package:smpd_fee_mate_app/core/utils/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: AppColors.textColor),
            title: const Text('Account', style: TextStyle(color: AppColors.textColor)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

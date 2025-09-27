import 'package:flutter/material.dart';
import 'package:smpd_fee_mate_app/core/utils/app_colors.dart';

/// Header of app
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String avatarUrl;

  const AppHeader({
    super.key,
    required this.title,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textColor),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:smpd_fee_mate_app/core/utils/app_colors.dart';

class CustomInfoListSection extends StatelessWidget {
  final String title;
  final List<InfoListData> items;

  const CustomInfoListSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textColor),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: (item.avatarUrl != null && item.avatarUrl.isNotEmpty)
                    ? NetworkImage(item.avatarUrl)
                    : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
                radius: 22,
              ),
              title: Text(item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
              subtitle: Text(item.subtitle,
                  style: const TextStyle(color: AppColors.dividerColor)),
            );
          },
        ),
        InkWell(
          onTap: () {
            // TODO: Implement 'View All' functionality
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'View All',
                style: TextStyle(
                  color: AppColors.dividerColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: AppColors.dividerColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoListData {
  final String title;
  final String subtitle;
  final String avatarUrl;

  const InfoListData({
    required this.title,
    required this.subtitle,
    required this.avatarUrl,
  });
}

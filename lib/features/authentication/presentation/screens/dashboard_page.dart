import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smpd_fee_mate_app/core/widgets/app_bottom_nav_bar.dart';
import 'package:smpd_fee_mate_app/core/widgets/app_drawer.dart';
import 'package:smpd_fee_mate_app/core/widgets/app_header.dart';
import 'package:smpd_fee_mate_app/core/utils/app_colors.dart';
import 'package:smpd_fee_mate_app/core/widgets/custom_button.dart';
import 'package:smpd_fee_mate_app/core/widgets/custom_info_list_section.dart';
import 'package:smpd_fee_mate_app/core/widgets/custom_stat_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic>? _dashboardData;

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/dashboard_data.json');
    final data = json.decode(jsonString);
    setState(() {
      _dashboardData = data;
    });
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'groups':
        return Icons.groups;
      case 'event_available':
        return Icons.event_available;
      case 'currency_rupee':
        return Icons.currency_rupee;
      case 'access_time':
        return Icons.access_time;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_dashboardData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final statCards =
        (_dashboardData!['stat_cards'] as List).cast<Map<String, dynamic>>();
    final upcomingSessions = _dashboardData!['upcoming_sessions'];
    final recentPayments = _dashboardData!['recent_payments'];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const AppHeader(
        title: 'Dashboard',
        avatarUrl: '',
      ),
      endDrawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Stats Cards
              _buildStatCards(statCards),
              const SizedBox(height: 28),
              CustomInfoListSection(
                title: upcomingSessions['title'],
                items: (upcomingSessions['items'] as List)
                    .map((item) => InfoListData(
                          title: item['title'],
                          subtitle: item['subtitle'],
                          avatarUrl: item['avatarUrl'],
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8),
              // Recent Payments
              CustomInfoListSection(
                title: recentPayments['title'],
                items: (recentPayments['items'] as List)
                    .map((item) => InfoListData(
                          title: item['title'],
                          subtitle: item['subtitle'],
                          avatarUrl: item['avatarUrl'],
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  btnText: 'New Session',
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  btnRadius: 12,
                  shape: ButtonShape.roundedRectangle,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }

  Widget _buildStatCards(List<Map<String, dynamic>> statCards) {
    List<Widget> rows = [];
    for (int i = 0; i < statCards.length; i += 2) {
      List<Widget> rowChildren = [];
      rowChildren.add(
        _buildStatCard(statCards[i]),
      );
      rowChildren.add(const SizedBox(width: 12));
      if (i + 1 < statCards.length) {
        rowChildren.add(
          _buildStatCard(statCards[i + 1]),
        );
      } else {
        rowChildren.add(Expanded(child: Container()));
      }

      rows.add(IntrinsicHeight(child: Row(children: rowChildren)));
      if (i + 2 < statCards.length) {
        rows.add(const SizedBox(height: 12));
      }
    }
    return Column(children: rows);
  }

  Widget _buildStatCard(Map<String, dynamic> cardData) {
    return CustomStatCard(
      title: cardData['title'],
      value: cardData['value'],
      icon: _getIcon(cardData['icon']),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(cardData['title']),
            content: Text('You tapped on "${cardData['title']}" card.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

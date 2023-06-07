import 'package:flutter/material.dart';

enum BottomNavigationTab {
  home(
    label: 'Person',
    icon: Icons.person,
  ),

  timeline(
    label: 'Bookmark',
    icon: Icons.bookmarks,
  ),

  settings(
    label: 'Setting',
    icon: Icons.settings,
  );

  const BottomNavigationTab({
    required this.label,
    required this.icon,
  });

  /// ラベル
  final String label;

  /// アイコン
  final IconData icon;
}

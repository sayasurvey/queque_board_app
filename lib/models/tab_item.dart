import 'package:flutter/material.dart';

enum TabItem {
  person(
    label: 'Person',
    icon: Icons.person,
  ),

  bookmarks(
    label: 'Bookmark',
    icon: Icons.bookmarks,
  ),

  settings(
    label: 'Setting',
    icon: Icons.settings,
  );

  const TabItem({
    required this.label,
    required this.icon,
  });

  /// ラベル
  final String label;

  /// アイコン
  final IconData icon;
}

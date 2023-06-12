import 'package:flutter/material.dart';
import 'package:queque_board_app/pages/person_page.dart';
import 'package:queque_board_app/pages/bookmark_page.dart';
import 'package:queque_board_app/pages/setting_page.dart';

enum TabItem {
  person(label: 'Person', icon: Icons.person, page: PersonPage()),

  bookmarks(
    label: 'Bookmark',
    icon: Icons.bookmarks,
    page: BookmarkPage(),
  ),

  settings(
    label: 'Setting',
    icon: Icons.settings,
    page: SettingPage(),
  );

  const TabItem({
    required this.label,
    required this.icon,
    required this.page,
  });

  /// ラベル
  final String label;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}

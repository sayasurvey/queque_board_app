import 'package:flutter/material.dart';
import 'package:queque_board_app/screen/user_setting.dart';
import 'package:queque_board_app/screen/user_posts/timeline.dart';
import 'package:queque_board_app/screen/user_setting/setting_page.dart';

enum TabItem {
  settings(
    label: 'Setting',
    icon: Icons.settings,
    page: SettingPage(),
  ),
  bookmarks(
    label: 'Bookmark',
    icon: Icons.bookmarks,
    page: BookmarkPage(),
  ),

  person(label: 'Person', icon: Icons.person, page: PersonPage());

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

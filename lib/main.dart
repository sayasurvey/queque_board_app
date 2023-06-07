import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'utils/basepage_bottom_navigation_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('クエクエボード'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('ここにテキストフィールドが表示される。'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: BottomNavigationTab.values
              .map(
                (tabItem) => BottomNavigationBarItem(
                  icon: Icon(tabItem.icon),
                  label: tabItem.label,
                ),
              )
              .toList(),
        ));
  }
}

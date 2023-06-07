import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'utils/tab_item.dart';

/// タブごとのナビゲーションスタックの状態を管理する
final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.person: GlobalKey<NavigatorState>(),
  TabItem.bookmarks: GlobalKey<NavigatorState>(),
  TabItem.settings: GlobalKey<NavigatorState>(),
};

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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentTab = useState(TabItem.person);
    return Scaffold(
        appBar: AppBar(
          title: Text('クエクエボード'),
          centerTitle: true,
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: '性',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: '名',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'メールアドレス',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'パスワード',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'パスワード確認',
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: TabItem.values.indexOf(currentTab.value),
          items: TabItem.values
              .map(
                (tabItem) => BottomNavigationBarItem(
                  icon: Icon(tabItem.icon),
                  label: tabItem.label,
                ),
              )
              .toList(),
          onTap: (index) {
            final selectedTab = TabItem.values[index];
            if (currentTab.value == selectedTab) {
              _navigatorKeys[selectedTab]
                  ?.currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              // 未選択
              currentTab.value = selectedTab;
            }
          },
        ));
  }
}

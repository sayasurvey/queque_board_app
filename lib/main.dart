import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'utils/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      // iPhone8を基準に多端末対応を行う
      designSize: const Size(750, 1334),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      },
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
        body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'ユーザー登録',
                        style: TextStyle(
                          fontSize: 25.0, // font size
                          fontWeight: FontWeight.bold, // make it bold
                        ),
                      ),
                    ],
                  ),
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
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Button pressed!');
                        },
                        child: Text('Press me'),
                      ),
                    ],
                  ),
                ],
              ),
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

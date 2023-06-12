import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:queque_board_app/models/tab_item.dart';

/// タブごとのナビゲーションスタックの状態を管理する
final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.person: GlobalKey<NavigatorState>(),
  TabItem.bookmarks: GlobalKey<NavigatorState>(),
  TabItem.settings: GlobalKey<NavigatorState>(),
};

class BasePage extends HookWidget {
  const BasePage({super.key});

  // This widget is the root of your application.
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
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: '姓', border: OutlineInputBorder()),
                    maxLength: 12,
                    autofocus: true,
                    // focus移動
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '名',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'メールアドレス',
                    ),
                  ),
                  TextFormField(
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
                        child: Text('登録'),
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

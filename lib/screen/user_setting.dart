import 'package:flutter/material.dart';
import 'package:queque_board_app/screen/account%20_registration/account_registration_page.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserRegistration()),
            );
          },
          child: Text('ユーザー登録'),
        ),
      ),
    );
  }
}

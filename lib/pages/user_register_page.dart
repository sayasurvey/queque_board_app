import 'package:flutter/material.dart';
import 'package:queque_board_app/models/text_field_model.dart';

class UserRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30.0), // 左右に30のmargin
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左詰め配置
        children: <Widget>[
          SizedBox(height: 20.0),
          // ユーザー情報を入力するTextFieldを配置する。
          Text(
            'ユーザー登録',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextFiledListView(),
          SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                print('Button pressed!');
              },
              child: Text('登録'),
            ),
          ),
        ],
      ),
    ));
  }
}

class TextFiledListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true, // Listのサイズを子ウィジェットの合計サイズに合わせる。
      physics: NeverScrollableScrollPhysics(), // ListViewのスクロールを無効化
      itemCount: registrationFields.length,
      itemBuilder: (context, index) {
        return CustomTextField(
          title: registrationFields[index].title,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.0);
      },
    );
  }
}

class UserRegistrationForm extends StatefulWidget {
  @override
  _UserRegistrationFormState createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      title: "",
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String title;

  CustomTextField({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// TextFieldModelはテキストフィールドに関する情報を保持する
class TextFieldModel {
  final String title;

  TextFieldModel({
    required this.title,
  });
}

/// ユーザー登録画面で使用するテキストフィールド
List<TextFieldModel> registrationFields = [
  TextFieldModel(
    title: 'ニックネーム',
  ),
  TextFieldModel(
    title: 'メールアドレス',
  ),
  TextFieldModel(
    title: 'パスワード',
  ),
  TextFieldModel(
    title: 'パスワード確認',
  ),
];

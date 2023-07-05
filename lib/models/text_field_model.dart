import 'package:flutter/material.dart';

/// TextFieldModelはテキストフィールドに関する情報を保持する
class TextFieldModel {
  final String title;
// TODO: バリデーション追加
  TextFieldModel({
    required this.title,
  });
}

/// ユーザー登録画面で使用するテキストフィールド
List<TextFieldModel> registrationFields = [
  TextFieldModel(
    title: 'id',
  ),
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

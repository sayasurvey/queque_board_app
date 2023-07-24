import 'package:flutter/material.dart';

/// TextFieldModelはテキストフィールドに関する情報を保持する
class TextFieldModel {
  final String title;
  final FormFieldValidator<String> validator;
// TODO: バリデーション追加
  TextFieldModel({
    required this.title,
    required this.validator,
  });
}

/// ユーザー登録画面で使用するテキストフィールド
List<TextFieldModel> registrationFields = [
  TextFieldModel(
    title: 'id',
    validator: (value) {
      // 全角文字以外を含む場合エラー
      if (value != null &&
          !value.runes.every((rune) {
            var codeUnit = String.fromCharCode(rune).codeUnitAt(0);
            return codeUnit >= 0x3000 && codeUnit <= 0xFFFD;
          })) {
        return 'Error: Contains non-fullwidth characters';
      }
      return null;
    },
  ),
  TextFieldModel(
    title: 'ニックネーム',
    validator: (value) {
      // 全角文字以外を含む場合エラー
      if (value != null &&
          !value.runes.every((rune) {
            var codeUnit = String.fromCharCode(rune).codeUnitAt(0);
            return codeUnit >= 0x3000 && codeUnit <= 0xFFFD;
          })) {
        return 'Error: Contains non-fullwidth characters';
      }
      return null;
    },
  ),
  TextFieldModel(
    title: 'メールアドレス',
    validator: (value) {
      // 全角文字以外を含む場合エラー
      if (value != null &&
          !value.runes.every((rune) {
            var codeUnit = String.fromCharCode(rune).codeUnitAt(0);
            return codeUnit >= 0x3000 && codeUnit <= 0xFFFD;
          })) {
        return 'Error: Contains non-fullwidth characters';
      }
      return null;
    },
  ),
  TextFieldModel(
    title: 'パスワード',
    validator: (value) {
      // 全角文字以外を含む場合エラー
      if (value != null &&
          !value.runes.every((rune) {
            var codeUnit = String.fromCharCode(rune).codeUnitAt(0);
            return codeUnit >= 0x3000 && codeUnit <= 0xFFFD;
          })) {
        return 'Error: Contains non-fullwidth characters';
      }
      return null;
    },
  ),
  TextFieldModel(
    title: 'パスワード確認',
    validator: (value) {
      // 全角文字以外を含む場合エラー
      if (value != null &&
          !value.runes.every((rune) {
            var codeUnit = String.fromCharCode(rune).codeUnitAt(0);
            return codeUnit >= 0x3000 && codeUnit <= 0xFFFD;
          })) {
        return 'Error: Contains non-fullwidth characters';
      }
      return null;
    },
  ),
];

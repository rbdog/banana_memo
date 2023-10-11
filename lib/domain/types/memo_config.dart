import 'package:my_app/domain/types/memo.dart';

/// メモに関する設定値
class MemoConfig {
  MemoConfig({
    required this.defaultText,
    required this.maxLength,
    required this.exampleMemos,
  });

  /// はじめからメモに書かれている文字
  final String defaultText;

  /// メモに書ける最大文字数
  final int maxLength;

  /// サンプルのメモたち
  final List<Memo> exampleMemos;
}

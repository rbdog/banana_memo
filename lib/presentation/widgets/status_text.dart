import 'package:flutter/material.dart';
import 'package:my_app/domain/types/status.dart';
import 'package:my_app/presentation/theme/fonts.dart';
import 'package:my_app/presentation/theme/l10n.dart';

/// ステータス文字
class StatusText extends StatelessWidget {
  const StatusText({
    super.key,
    required this.status,
    this.style = BrandText.titleL,
  });

  /// ステータス
  final Status status;

  /// 文字スタイル
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final text = switch (status) {
      Status.todo => L10n.statusTodo,
      Status.doing => L10n.statusDoing,
      Status.done => L10n.statusDone,
    };
    return Text(text, style: style);
  }
}

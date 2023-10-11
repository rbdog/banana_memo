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
    switch (status) {
      case Status.todo:
        return Text(
          L10n.statusTodo,
          style: style,
        );
      case Status.doing:
        return Text(
          L10n.statusDoing,
          style: style,
        );
      case Status.done:
        return Text(
          L10n.statusDone,
          style: style,
        );
    }
  }
}

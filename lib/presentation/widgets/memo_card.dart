import 'package:flutter/material.dart';
import 'package:my_app/domain/types/memo.dart';
import 'package:my_app/presentation/theme/colors.dart';
import 'package:my_app/presentation/theme/fonts.dart';
import 'package:my_app/presentation/theme/sizes.dart';
import 'package:my_app/presentation/widgets/delete_button.dart';
import 'package:my_app/presentation/widgets/status_image.dart';

/// メモカード
class MemoCard extends StatelessWidget {
  const MemoCard({
    super.key,
    required this.memo,
    required this.onPressed,
    required this.onPressedDelete,
  });

  /// 表示するメモ
  final Memo memo;

  /// コールバック カード全体
  final VoidCallback onPressed;

  /// コールバック 削除
  final VoidCallback onPressedDelete;

  @override
  Widget build(BuildContext context) {
    /// ステータス表示エリア
    final statusLabel = Container(
      width: RawSize.p60,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(RawSize.p8),
      color: BrandColor.bananaYellow,
      child: StatusImage(status: memo.status),
    );

    /// メモの文字を表示するエリア
    final textArea = Container(
      alignment: Alignment.centerLeft,
      child: Text(
        memo.text,
        textAlign: TextAlign.left,
        style: BrandText.bodyS,
        maxLines: 1,
      ),
    );

    /// ボタンを並べるエリア
    final actionsRow = Row(
      children: [
        const Spacer(),
        DeleteButton(onPressed: onPressedDelete),
      ],
    );

    /// レイアウト
    final layouts = SizedBox(
      height: RawSize.p90,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          statusLabel,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(RawSize.p4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: textArea),
                  actionsRow,
                ],
              ),
            ),
          ),
        ],
      ),
    );

    /// タップを検知
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: layouts,
      ),
    );
  }
}

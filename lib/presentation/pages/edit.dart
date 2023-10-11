import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/application/di/usecases.dart';
import 'package:my_app/application/di/infrastructure.dart';
import 'package:my_app/application/state/editting_memo_provider.dart';
import 'package:my_app/presentation/theme/colors.dart';
import 'package:my_app/presentation/theme/l10n.dart';
import 'package:my_app/presentation/theme/sizes.dart';
import 'package:my_app/presentation/widgets/gap.dart';
import 'package:my_app/presentation/widgets/save_button.dart';
import 'package:my_app/presentation/widgets/status_button.dart';
import 'package:my_app/presentation/widgets/text_edit_form.dart';
import 'package:my_app/presentation/widgets/status_text.dart';
import 'package:my_app/presentation/dialogs/warn.dart';
import 'package:my_app/presentation/router/go_router.dart';

/// 編集画面
class EditPage extends ConsumerWidget {
  const EditPage({
    super.key,
    required this.memoId,
  });

  final String memoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// logger
    final logger = ref.watch(loggerProvider);
    logger.debug('EditPage.build()');

    /// 編集中のメモ
    final memo = ref.watch(edittingMemoProvider(memoId));

    /// ステータスボタン
    final statusButton = SizedBox(
      width: RawSize.p60,
      height: RawSize.p60,
      child: StatusButton(
        status: memo.status,
        onPressed: () {
          // ユースケースを呼び出す
          final usecase = ref.read(updateMemoProvider(memoId));
          usecase.editStatus();
        },
      ),
    );

    /// ステータス文字
    final statusText = StatusText(status: memo.status);

    /// テキスト編集フォーム
    final editForm = TextEditForm(
      value: memo.text,
      onChanged: (value) {
        // ユースケースを呼び出す
        final usecase = ref.read(updateMemoProvider(memoId));
        usecase.editText(value);
      },
    );

    /// 保存ボタン
    final saveButton = SaveButton(
      onPressed: () {
        // ユースケースを呼び出す
        final usecase = ref.read(updateMemoProvider(memoId));
        usecase.save(
          onValidateFailure: () {
            // 失敗したらダイアログを表示
            showWarnDialog(
              context,
              L10n.tooLongTextMesage,
            );
          },
          onSuccess: () {
            // 成功したら前の画面に戻る
            final router = ref.read(goRouterProvider);
            router.pop();
          },
        );
      },
    );

    /// 画面レイアウト
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.bananaYellow,
        title: const Text(L10n.edit),
      ),
      floatingActionButton: saveButton,
      body: Container(
        padding: const EdgeInsets.all(RawSize.p8),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 1),
            Row(
              children: [
                statusButton,
                Gap.w(RawSize.p8),
                statusText,
              ],
            ),
            Gap.h(RawSize.p20),
            editForm,
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

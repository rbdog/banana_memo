import 'package:my_app/domain/types/memo.dart';
import 'package:my_app/domain/types/status.dart';

/// メモの更新ルールを担当するクラス
class MemoUpdater {
  /// ステータスを次に進める
  Memo switchStatus(Memo memo) {
    final next = switch (memo.status) {
      Status.todo => Status.doing, // 予定 => 進行中
      Status.doing => Status.done, // 進行中 => 完了
      Status.done => Status.todo, // 完了 => 予定(戻す)
    };
    // ステータスを変更
    return memo.copyWith(status: next);
  }

  /// テキストを変更
  Memo updateText(Memo memo, String newText) {
    // テキストを変更
    return memo.copyWith(text: newText);
  }
}

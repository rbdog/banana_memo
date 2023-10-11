import 'package:my_app/domain/types/memo.dart';
import 'package:my_app/domain/types/status.dart';

/// メモの更新ルールを担当するクラス
class MemoUpdater {
  /// ステータスを次に進める
  Memo switchStatus(Memo memo) {
    late final Status next;
    switch (memo.status) {
      case Status.todo:
        // 予定 => 進行中
        next = Status.doing;
        break;
      case Status.doing:
        // 進行中 => 完了
        next = Status.done;
        break;
      case Status.done:
        // 完了 => 予定(戻す)
        next = Status.todo;
        break;
    }
    // ステータスを変更してメモを返す
    return memo.copyWith(
      status: next,
    );
  }

  /// 書かれた文字を上書きして更新する
  Memo updateText(Memo memo, String newText) {
    return memo.copyWith(
      text: newText,
    );
  }
}

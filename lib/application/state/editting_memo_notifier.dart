import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/domain/types/memo.dart';

/// 編集中メモを管理するノティファイヤ
class EdittingMemoNotifier extends StateNotifier<Memo> {
  EdittingMemoNotifier(
    /// 初期値
    Memo initialMemo,
  ) : super(initialMemo);

  /// 現在の状態
  Memo get value => state;

  /// 更新
  void update(Memo memo) {
    state = memo;
  }
}

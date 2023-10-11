import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/domain/types/memo.dart';

/// メモ一覧を管理するノティファイヤ
class MemoListNotifier extends StateNotifier<List<Memo>> {
  MemoListNotifier(
    /// 初期値
    List<Memo> initialList,
  ) : super(initialList);

  /// 新しい一覧をセットする
  void set(List<Memo> list) {
    state = list;
  }

  /// リストの一番末尾にメモを追加する
  void add(Memo memo) {
    state = [...state, memo];
  }

  /// 指定されたIDのメモを削除する
  void delete(String id) {
    final list = List.of(state);
    list.removeWhere(
      (memo) => memo.id == id,
    );
    state = list;
  }

  /// メモを上書きする
  void replace(Memo memo) {
    state = state.map((old) {
      if (old.id == memo.id) {
        return memo;
      } else {
        return old;
      }
    }).toList();
  }
}

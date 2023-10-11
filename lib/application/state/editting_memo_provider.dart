import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/domain/types/memo.dart';
import 'package:my_app/application/state/editting_memo_notifier.dart';
import 'package:my_app/application/state/memo_list_provider.dart';

/// 編集中メモのプロバイダー
final edittingMemoProvider =
    StateNotifierProvider.family<EdittingMemoNotifier, Memo, String>(
  (ref, id) {
    final list = ref.read(memoListProvider);
    final initialState = list.firstWhere(
      (memo) => memo.id == id,
    );
    return EdittingMemoNotifier(initialState);
  },
);

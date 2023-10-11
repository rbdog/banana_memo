import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:banana_memo/domain/types/memo.dart';
import 'package:banana_memo/application/state/memo_list_notifier.dart';

/// メモ一覧のプロバイダー
final memoListProvider = StateNotifierProvider<MemoListNotifier, List<Memo>>(
  (ref) {
    return MemoListNotifier([]);
  },
);

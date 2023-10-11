import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/domain/types/memo.dart';
import 'package:my_app/application/state/memo_list_notifier.dart';

/// メモ一覧のプロバイダー
final memoListProvider = StateNotifierProvider<MemoListNotifier, List<Memo>>(
  (ref) {
    return MemoListNotifier([]);
  },
);

import 'package:banana_memo/domain/features/memo_creator.dart';
import 'package:banana_memo/application/config/memo.dart';
import 'package:banana_memo/application/state/memo_list_notifier.dart';
import 'package:banana_memo/application/types/analytics_event.dart';
import 'package:banana_memo/application/interfaces/firebase.dart';
import 'package:banana_memo/application/interfaces/logger.dart';

/// メモを追加する
class AddMemoUsecase {
  AddMemoUsecase({
    required this.logger,
    required this.listNotifier,
    required this.firebase,
  });
  final Logger logger;
  final MemoListNotifier listNotifier;
  final FirebaseService firebase;

  /// 新しいメモをリストに追加する
  Future<void> addNewMemo() async {
    logger.debug('AddMemoUsecase.addNewMemo()');
    // Firebaseにイベントを報告する
    firebase.sendEvent(AnalyticsEvent.addNewMemo);

    // ドメインを呼んで新しいメモを作成
    final creator = MemoCreater(
      defaultText: memoConfig.defaultText,
    );
    final memo = creator.createNewMemo();

    // リストに追加して状態を変更
    listNotifier.add(memo);
  }
}

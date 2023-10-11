import 'package:my_app/application/config/memo.dart';
import 'package:my_app/application/state/memo_list_notifier.dart';
import 'package:my_app/application/interfaces/logger.dart';
import 'package:my_app/application/interfaces/firebase.dart';

/// アプリの初期準備をする
class InitAppUsecase {
  InitAppUsecase({
    required this.logger,
    required this.firebase,
    required this.listNotifier,
  });
  final Logger logger;
  final FirebaseService firebase;
  final MemoListNotifier listNotifier;

  /// 一連の流れをまとめて実施する
  Future<void> execute() async {
    logger.debug('InitAppUsecase.execute()');

    // Firebaseを初期化
    await firebase.init();

    // リスト一覧を初期化
    // 今回はサンプルデータを使う
    final initialList = memoConfig.exampleMemos;
    listNotifier.set(initialList);
  }
}

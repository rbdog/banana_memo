import 'package:my_app/infrastructure/log/log_level.dart';

/// Log
class Log {
  const Log({
    required this.createdAt,
    required this.level,
    required this.tags,
    required this.msg,
  });

  /// 時刻
  final String createdAt;

  /// ログレベル
  final LogLevel level;

  /// 本文メッセージ
  final String msg;

  /// タグたち
  final List<String> tags;
}

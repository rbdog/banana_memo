/// LogLevel
enum LogLevel {
  /// 即時に緊急対応
  fatal(60),

  /// 営業時間に最優先で対応
  error(50),

  /// 次回リリースまでに対応
  warn(40),

  /// 対応不要 大きなイベントと情報を記録
  info(30),

  /// 対応不要 小さいイベントと情報を記録
  debug(20),

  /// 対応不要 一番小さい情報
  trace(10);

  const LogLevel(this.priority);
  final int priority;
}

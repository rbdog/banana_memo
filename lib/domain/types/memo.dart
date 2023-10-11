import 'package:my_app/domain/types/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'memo.freezed.dart';

@freezed
class Memo with _$Memo {
  const factory Memo({
    /// ID
    required String id,

    /// ステータス
    required Status status,

    /// 書かれた文字
    required String text,
  }) = _Memo;
}

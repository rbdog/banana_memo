import 'package:banana_memo/application/types/flavor.dart';

/// フレーバー
final flavor = _readFlavor();

/// 設定されたフレーバーを読み取る
Flavor _readFlavor() {
  const flavorString = String.fromEnvironment('flavor');
  if (flavorString == 'dev') {
    return Flavor.dev;
  } else if (flavorString == 'stg') {
    return Flavor.stg;
  } else if (flavorString == 'prd') {
    return Flavor.prd;
  } else {
    throw Exception('Flavorが不明です');
  }
}

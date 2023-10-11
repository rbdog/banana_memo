import 'package:flutter/material.dart';
import 'package:my_app/presentation/theme/sizes.dart';

/// フォント
class BrandFont {
  static const general = 'NotoSansJP';
}

/// 文字スタイル
class BrandText {
  static const titleL = TextStyle(
    fontSize: RawSize.p28,
    fontFamily: BrandFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleM = TextStyle(
    fontSize: RawSize.p24,
    fontFamily: BrandFont.general,
    fontWeight: FontWeight.bold,
  );
  static const titleS = TextStyle(
    fontSize: RawSize.p20,
    fontFamily: BrandFont.general,
  );
  static const bodyL = TextStyle(
    fontSize: RawSize.p18,
    fontFamily: BrandFont.general,
  );
  static const bodyM = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: BrandFont.general,
  );
  static const bodyS = TextStyle(
    fontSize: RawSize.p16,
    fontFamily: BrandFont.general,
  );
}

import 'package:flutter/material.dart';
import 'package:my_app/presentation/theme/colors.dart';
import 'package:my_app/presentation/theme/fonts.dart';
import 'package:my_app/presentation/theme/l10n.dart';
import 'package:my_app/presentation/theme/sizes.dart';

/// カスタムダイアログ 警告用
class WarnDialog extends StatelessWidget {
  const WarnDialog({
    super.key,
    required this.message,
    required this.onPressedOk,
  });

  final String message;
  final VoidCallback onPressedOk;

  @override
  Widget build(BuildContext context) {
    final messageArea = Expanded(
      child: Container(
        padding: const EdgeInsets.all(RawSize.p4),
        alignment: Alignment.center,
        child: Text(
          message,
          style: BrandText.bodyM,
          maxLines: 5,
        ),
      ),
    );

    final buttonArea = SizedBox(
      width: double.infinity,
      height: RawSize.p40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: BrandColor.bananaYellow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        onPressed: onPressedOk,
        child: Text(
          L10n.ok,
          style: BrandText.titleS.copyWith(
            color: BrandColor.white,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: BrandColor.bananaYellow,
              width: RawSize.p4,
            ),
            borderRadius: BorderRadius.circular(RawSize.p8),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              messageArea,
              buttonArea,
            ],
          ),
        ),
      ),
    );
  }
}

void showWarnDialog(
  BuildContext context,
  String message,
) {
  showDialog(
    context: context,
    builder: (context) {
      return WarnDialog(
        message: message,
        onPressedOk: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}

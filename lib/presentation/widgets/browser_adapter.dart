import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ブラウザでもスマホと同じ比率で表示
class BrowserAdapter extends StatelessWidget {
  const BrowserAdapter({
    super.key,
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: AspectRatio(
            // テスト表示なので適当に
            aspectRatio: 9.0 / 16.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: child,
            ),
          ),
        ),
      );
    }
    // Web以外のときは何もしない
    return child ?? const SizedBox.shrink();
  }
}

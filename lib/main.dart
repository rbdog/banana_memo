import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:my_app/presentation/router/app.dart';

void main() {
  const app = App();
  const scope = ProviderScope(child: app);

  // Device Preview
  Widget window = scope;
  if (kIsWeb) {
    window = DevicePreview(
      builder: (context) => scope,
    );
  }

  runApp(window);
}

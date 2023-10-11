import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/presentation/theme/fonts.dart';
import 'package:my_app/presentation/router/go_router.dart';
import 'package:my_app/presentation/widgets/browser_adapter.dart';

/// アプリ本体
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser, // GoRouter
      routeInformationProvider: router.routeInformationProvider, // GoRouter
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return BrowserAdapter(child: child);
      },
      theme: ThemeData(
        fontFamily: BrandText.bodyS.fontFamily,
      ),
    );
  }
}

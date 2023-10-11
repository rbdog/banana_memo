import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:banana_memo/application/interfaces/firebase.dart';
import 'package:banana_memo/application/interfaces/logger.dart';
import 'package:banana_memo/application/config/flavor.dart';
import 'package:banana_memo/application/types/flavor.dart';
// DI は特別に外レイヤーをimportする
import 'package:banana_memo/infrastructure/firebase/fake_firebase.dart';
import 'package:banana_memo/infrastructure/firebase/firebase.dart';
import 'package:banana_memo/infrastructure/log/fake_logger.dart';
import 'package:banana_memo/infrastructure/log/logger.dart';

/// Firebase
final firebaseProvider = Provider<FirebaseService>(
  (ref) {
    switch (flavor) {
      case Flavor.dev:
        return FakeFirebaseService();
      case Flavor.stg:
        return FakeFirebaseService();
      case Flavor.prd:
        return DefaultFirebaseService();
    }
  },
);

/// Logger
final loggerProvider = Provider<Logger>(
  (ref) {
    switch (flavor) {
      case Flavor.dev:
        return FakeLogger();
      case Flavor.stg:
        return FakeLogger();
      case Flavor.prd:
        return DefaultLogger();
    }
  },
);

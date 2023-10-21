import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/application/interfaces/firebase.dart';
import 'package:my_app/application/interfaces/logger.dart';
import 'package:my_app/application/config/flavor.dart';
import 'package:my_app/application/types/flavor.dart';
// DI は特別に外レイヤーをimportする
import 'package:my_app/infrastructure/firebase/fake_firebase.dart';
import 'package:my_app/infrastructure/firebase/firebase.dart';
import 'package:my_app/infrastructure/log/fake_logger.dart';

/// Firebase
final firebaseProvider = Provider<FirebaseService>((ref) {
  return switch (flavor) {
    Flavor.dev => FakeFirebaseService(),
    Flavor.stg => FakeFirebaseService(),
    Flavor.prd => DefaultFirebaseService(),
  };
});

/// Logger
final loggerProvider = Provider<Logger>((ref) {
  return switch (flavor) {
    Flavor.dev => FakeLogger(),
    Flavor.stg => FakeLogger(),
    Flavor.prd => FakeLogger(),
  };
});

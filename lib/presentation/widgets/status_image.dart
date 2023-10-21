import 'package:flutter/material.dart';
import 'package:my_app/domain/types/status.dart';
import 'package:my_app/presentation/theme/images.dart';

/// ステータス画像
class StatusImage extends StatelessWidget {
  const StatusImage({
    super.key,
    required this.status,
  });

  /// ステータス
  final Status status;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      switch (status) {
        Status.todo => BrandImage.statusTodo.path,
        Status.doing => BrandImage.statusDoing.path,
        Status.done => BrandImage.statusDone.path,
      },
    );
  }
}

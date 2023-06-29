import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';

abstract class _ProgressIndicator extends StatelessWidget {
  final double progressSize;
  final Color progressColor;
  final double progressWidth;

  const _ProgressIndicator(
      {Key? key,
        required this.progressSize,
        required this.progressColor,
        required this.progressWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularProgressIndicator(
        color: progressColor,
        strokeWidth: progressWidth,
      ),
      height: progressSize,
      width: progressSize,
    );
  }
}

class AppProgressIndicator extends _ProgressIndicator {
  const AppProgressIndicator()
      : super(
    progressSize: AppUI.progressIndicatorSize,
    progressColor: AppColors.appColor,
    progressWidth: 3.0,
  );
}

class ButtonProgressIndicator extends _ProgressIndicator {
  const ButtonProgressIndicator()
      : super(
    progressSize: AppUI.progressIndicatorSizeSmall,
    progressColor: Colors.white,
    progressWidth: 2.0,
  );
}

class TextFieldProgressIndicator extends _ProgressIndicator {
  const TextFieldProgressIndicator()
      : super(
    progressSize: AppUI.progressIndicatorSizeSmall,
    progressColor: AppColors.appColor,
    progressWidth: 2.0,
  );
}
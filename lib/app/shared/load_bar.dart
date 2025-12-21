import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

enum Spinner {
  SpinKitFadingCircle,
  SpinKitThreeBounce,
  SpinKitCubeGrid,
  SpinKitSquareCircle,
  CircleSpinner,
}

class LoadBar extends StatelessWidget {
  final Spinner? spinner;
  final double size;
  final Color color;
  const LoadBar({
    super.key,
    this.spinner = Spinner.SpinKitFadingCircle,
    this.size = 100,
    this.color = AppTheme.main_color_1,
  });

  @override
  Widget build(BuildContext context) {
    switch (spinner) {
      case Spinner.SpinKitFadingCircle:
        return SpinKitFadingCircle(
          size: size,
          color: color,
          duration: AppConstant.duration_spinner,
        );
      case Spinner.SpinKitThreeBounce:
        return SpinKitThreeBounce(
          size: size,
          color: color,
          duration: AppConstant.duration_spinner,
        );
      case Spinner.SpinKitCubeGrid:
        return SpinKitCubeGrid(
          size: size,
          color: color,
          duration: AppConstant.duration_spinner,
        );
      case Spinner.SpinKitSquareCircle:
        return SpinKitSquareCircle(
          size: size,
          color: color,
          duration: AppConstant.duration_spinner,
        );
      default:
        return SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            backgroundColor: AppTheme.transparent_color,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        );
    }
  }
}

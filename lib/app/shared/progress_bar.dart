import "package:flutter/material.dart";
import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";

import "../config/themes/app_theme.dart";
import "load_bar.dart";

class ProgressBar extends StatelessWidget {
  final bool anAsyncCall;
  final double opacity;
  final Color progressColor;
  final Widget progressIndicator;
  final Widget child;

  const ProgressBar({
    super.key,
    this.anAsyncCall = false,
    this.opacity = .75,
    required this.progressColor,
    this.progressIndicator = const LoadBar(spinner: Spinner.SpinKitFadingCircle, color: AppTheme.main_color_1),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: anAsyncCall,
      opacity: opacity,
      color: progressColor,
      progressIndicator: progressIndicator,
      child: child,
    );
  }
}

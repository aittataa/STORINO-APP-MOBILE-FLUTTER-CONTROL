import "package:flutter/material.dart";

class Disabled extends StatelessWidget {
  final bool state;
  final Widget child;
  const Disabled({
    super.key,
    this.state = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: state,
      child: Opacity(
        opacity: state ? .5 : 1,
        child: child,
      ),
    );
  }
}

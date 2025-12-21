import "package:flutter/material.dart";
import "package:get/get.dart";

class FloatingAnimation extends GetView<FloatingAnimationController> {
  final Widget child;

  const FloatingAnimation({
    super.key,
    this.child = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    /// TODO : Page Controller
    Get.lazyPut<FloatingAnimationController>(() => FloatingAnimationController());

    ///
    return Obx(() {
      final Animation<double> animation = controller.animation.value;
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(0, animation.value),
            child: child,
          );
        },
        child: child,
      );
    });
  }
}

class FloatingAnimationController extends GetxController with GetTickerProviderStateMixin {
  final Duration duration = 2500.milliseconds;
  late AnimationController animationController = AnimationController(duration: 2500.milliseconds, vsync: this);
  late CurvedAnimation animate = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOut,
  );
  late Rx<Animation<double>> animation = Tween<double>(begin: -8, end: 8).animate(animate).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    /// TODO : Animation
    animationController = AnimationController(
      duration: duration,
      vsync: this,
    )..repeat(reverse: true);
    animation.value = Tween<double>(begin: -8, end: 8).animate(animate);

    ///
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

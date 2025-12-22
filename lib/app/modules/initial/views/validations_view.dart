import "package:flutter/material.dart";
import "package:get/get.dart";

import "../controllers/initial_controller.dart";

class ValidationsView extends GetView<InitialController> {
  const ValidationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ValidationsView"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "ValidationsView is working",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

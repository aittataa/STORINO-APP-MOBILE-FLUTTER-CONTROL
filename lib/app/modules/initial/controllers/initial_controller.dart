import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:storino/app/config/translations/app_translation.dart";
import "package:storino/app/data/models/products.dart";

import "../../../data/data_sources/remote/remote_repository.dart";

class InitialController extends GetxController {
  late final RemoteRepository _remote = Get.put(RemoteRepository());

  ///

  final ScrollController scrollController_1 = ScrollController();
  final ScrollController scrollController_2 = ScrollController();
  final ScrollController scrollController_3 = ScrollController();

  ///
  final RxBool anAsyncCall = false.obs;
  final RxList<Products> products = <Products>[].obs;
  final Rx<Products> product = Products().obs;
  final RxString title = AppKeys.labelFeatured.name.tr.obs;

  ///
  @override
  Future<void> onInit() async {
    /// TODO : onInit
    super.onInit();
    return await getAllProducts();
  }

  /// TODO : Get AllProducts
  Future<void> getAllProducts() async {
    FocusManager.instance.primaryFocus?.unfocus();
    anAsyncCall.value = true;
    return Future<void>.delayed(10.seconds, () async {
      final List<Products> products = _remote.generateRandomProducts();
      anAsyncCall.value = false;
      this.products.value = products;
    });
  }

  ///
  final RxInt selectedIndex_1 = 0.obs;
  final double viewportFraction_1 = .85;
  late PageController pageController_1 = PageController(
    viewportFraction: viewportFraction_1,
    initialPage: selectedIndex_1.value,
  );

  void onPageChanged_1(int index) {
    selectedIndex_1.value = index;
    pageController_1 = PageController(
      viewportFraction: viewportFraction_1,
      initialPage: selectedIndex_1.value,
    );
  }
}

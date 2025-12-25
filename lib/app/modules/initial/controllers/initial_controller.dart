import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:storino/app/modules/initial/views/validations_view.dart";

import "../../../config/translations/app_translation.dart";
import "../../../data/data_sources/remote/remote_repository.dart";
import "../../../data/models/products.dart";
import "../views/orders_view.dart";

class InitialController extends GetxController {
  late final RemoteRepository _remote = Get.put(RemoteRepository());

  ///

  final ScrollController scrollController_1 = ScrollController();
  final ScrollController scrollController_2 = ScrollController();
  final ScrollController scrollController_3 = ScrollController();
  final ScrollController scrollController_4 = ScrollController();

  ///
  final RxBool anAsyncCall = false.obs;
  final RxList<Products> products = <Products>[].obs;
  final RxList<Products> orders = <Products>[].obs;
  final Rx<Products> product = Products().obs;
  final RxString title = AppKeys.labelFeatured.name.tr.obs;
  final Duration delays = 5.seconds;

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
    return Future<void>.delayed(delays, () async {
      final List<Products> products = _remote.generateRandomProducts();
      anAsyncCall.value = false;
      this.products.value = products;
    });
  }

  Future<void> handleCart() async {
    final Products product = this.product.value;
    final bool productInCart = orders.where((Products value) => value.id == product.id).toList().isNotEmpty;
    if (productInCart) {
      orders.remove(product);
    } else {
      orders.add(product);
      return Get.to(() {
        return const OrdersView();
      });
    }
  }

  Future<void> checkoutOrders() async {
    FocusManager.instance.primaryFocus?.unfocus();
    anAsyncCall.value = true;
    return Future<void>.delayed(delays, () async {
      anAsyncCall.value = false;
      return await Get.offAll(() {
        return const ValidationsView();
      })!.then((_) => orders.clear());
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

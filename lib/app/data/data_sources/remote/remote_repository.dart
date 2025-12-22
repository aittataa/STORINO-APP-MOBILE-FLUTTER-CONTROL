import "dart:developer";
import "dart:math" hide log;

import "package:get/get_connect/connect.dart";
import "package:injectable/injectable.dart";

import "../../models/products.dart";

@Injectable()
@LazySingleton()
class RemoteRepository extends GetConnect {
  RemoteRepository();
  @override
  Future<void> onInit() async {
    /// TODO : onInit
    super.onInit();
    return log("onInit : ProductsRepository");
  }

  ///
  ///

  final Random _random = Random();

  // final Uuid _uuid = const Uuid();

  String randomTitle() {
    List<String> productTitles = <String>[
      // Fashion
      "Classic Cotton T-Shirt",
      "Slim Fit Denim Jeans",
      "Oversized Hoodie",
      "Casual Summer Shirt",
      "Elegant Evening Dress",
      "Leather Biker Jacket",
      "Athletic Training Shorts",
      "Premium Polo Shirt",

      // Shoes
      "Running Performance Sneakers",
      "Casual Street Sneakers",
      "Leather Chelsea Boots",
      "Comfort Walking Shoes",
      "High-Top Canvas Shoes",
      "Breathable Gym Trainers",

      // Electronics
      "Wireless Bluetooth Headphones",
      "Noise-Cancelling Earbuds",
      "Smart Fitness Watch",
      "Portable Bluetooth Speaker",
      "USB-C Fast Charging Adapter",
      "Wireless Charging Pad",

      // Accessories
      "Minimalist Wrist Watch",
      "Genuine Leather Wallet",
      "Stylish Sunglasses",
      "Travel Backpack",
      "Crossbody Shoulder Bag",
      "Luxury Card Holder",

      // Home & Living
      "Modern Table Lamp",
      "Ergonomic Office Chair",
      "Wooden Coffee Table",
      "Soft Cotton Bed Sheets",
      "Decorative Wall Clock",
      "Minimalist Desk Organizer",

      // Beauty
      "Hydrating Face Cream",
      "Organic Hair Shampoo",
      "Matte Finish Lipstick",
      "Skin Care Gift Set",
    ];
    productTitles.shuffle();
    return productTitles[_random.nextInt(productTitles.length)];
  }

  String randomDescriptions() {
    List<String> productDescriptions = [
      "Crafted with premium materials for long-lasting comfort.",
      "Designed to combine modern style with everyday functionality.",
      "Perfect choice for casual wear and daily activities.",
      "High-quality construction ensures durability and elegance.",
      "Lightweight design with superior comfort and breathability.",
      "A stylish essential suitable for any season.",
      "Carefully engineered for performance and reliability.",
      "Modern minimalist design with a premium feel.",
      "An ideal balance between comfort, quality, and aesthetics.",
      "Made for people who appreciate style and functionality.",
      "Smooth texture with excellent finishing details.",
      "Built to deliver exceptional user experience every day.",
      "Designed to enhance your lifestyle effortlessly.",
      "A must-have product for modern living.",
      "Elegant design meets practical everyday use.",
      "Perfect for home, office, or outdoor use.",
      "Reliable, stylish, and built to last.",
      "Comfort-focused design with premium materials.",
      "Timeless design suitable for all occasions.",
      "High-performance product with a sleek finish.",
    ];
    productDescriptions.shuffle();
    return productDescriptions.take(5 + _random.nextInt(productDescriptions.length)).toString();
  }

  List<String> randomImages() {
    List<String> productImages = [
      "https://images.unsplash.com/photo-1520975916090-3105956dac38",
      "https://images.unsplash.com/photo-1512436991641-6745cdb1723f",
      "https://images.unsplash.com/photo-1541099649105-f69ad21f3246",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c",
      "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
      "https://images.unsplash.com/photo-1539533113208-f6df8cc8b543",
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
      "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6",
      "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a",
      "https://images.unsplash.com/photo-1519744346363-dc6e5c1c1c59",
      "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
      "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
      "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
      "https://images.unsplash.com/photo-1591561954557-26941169b49e",
      "https://images.unsplash.com/photo-1548036328-c9fa89d128fa",
      "https://images.unsplash.com/photo-1618354691249-18772d8b6b59",
      "https://images.unsplash.com/photo-1622560480605-d83c853bc5c3",
      "https://images.unsplash.com/photo-1586023492125-27b2c045efd7",
      "https://images.unsplash.com/photo-1524758631624-e2822e304c36",
      "https://images.unsplash.com/photo-1505691938895-1758d7feb511",
      "https://images.unsplash.com/photo-1549187774-b4e9b0445b41",
      "https://images.unsplash.com/photo-1596462502278-27bfdc403348",
      "https://images.unsplash.com/photo-1556228453-efd6c1ff04f6",
      "https://images.unsplash.com/photo-1571781926291-c477ebfd024b",
      "https://images.unsplash.com/photo-1596755389378-c31d21fd1273",
    ];
    productImages.shuffle();
    return productImages.take(3 + _random.nextInt(productImages.length)).toList();
  }

  List<String> randomSizes() {
    List<String> sizes = [
      "XS",
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "EU 36",
      "EU 38",
      "EU 40",
      "EU 42",
      "EU 44",
      "EU 46",
    ];
    sizes.shuffle();
    return sizes.take(5 + _random.nextInt(sizes.length)).toList(); // 5 to sizes.length
  }

  DateTime randomDate() {
    return DateTime.now().subtract(
      Duration(days: _random.nextInt(365), hours: _random.nextInt(24)),
    );
  }

  List<Products> generateRandomProducts() {
    return List<Products>.generate(100, (_) {
      return Products(
        title: randomTitle(),
        description: randomDescriptions(),
        price: _random.nextDouble() * 495 + 5,
        quantity: _random.nextInt(1000) + 1,
        images: randomImages(),
        sizes: randomSizes(),
        favored: true,
        created_at: randomDate(),
        updated_at: randomDate(),
        deleted_at: null,
      );
    });
  }
}

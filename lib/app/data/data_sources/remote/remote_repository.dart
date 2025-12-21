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

  List<String> sizes = [
    "XS",
    "S",
    "M",
    "L",
    "XL",
    "XXL",
    "XXXL",
    "34",
    "36",
    "38",
    "40",
    "42",
    "44",
    "46",
    "48",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "36",
    "38EU",
    "39EU",
    "40EU",
    "41EU",
    "42EU",
    "43EU",
    "44EU",
    "45EU",
    "6US",
    "7US",
    "8US",
    "9US",
    "10US",
    "11US",
    "One Size",
    "Kids S",
    "Kids M",
    "Kids L",
  ];

  List<String> productImages = [
    // Clothing
    "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
    "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
    "https://images.unsplash.com/photo-1514996937319-344454492b37",
    "https://images.unsplash.com/photo-1521334884684-d80222895322",
    "https://images.unsplash.com/photo-1523381210434-271e8be1f52b",
    "https://images.unsplash.com/photo-1523374228107-6e44bd2b524f",

    // Shoes
    "https://images.unsplash.com/photo-1542293787938-c9e299b8803c",
    "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
    "https://images.unsplash.com/photo-1600180758890-6ee0b7e4ff6f",
    "https://images.unsplash.com/photo-1582582494700-15a19d372b52",

    // Electronics
    "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
    "https://images.unsplash.com/photo-1510557880182-3d4d3cba35c1",
    "https://images.unsplash.com/photo-1580894732444-8ecdedb6c7ae",
    "https://images.unsplash.com/photo-1586190848861-99aa4a171e90",

    // Accessories
    "https://images.unsplash.com/photo-1581291519195-ef11498d1cf5",
    "https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d",
    "https://images.unsplash.com/photo-1581578731548-9ea3b7c7c67a",
    "https://images.unsplash.com/photo-1600185365622-07c7f9e3dc48",

    // Beauty
    "https://images.unsplash.com/photo-1515378791036-0648a3ef77b2",
    "https://images.unsplash.com/photo-1522337660859-02fbefca4702",
    "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9",
    "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",

    // Home Decor
    "https://images.unsplash.com/photo-1487014679447-9f8336841d58",
    "https://images.unsplash.com/photo-1481277542470-605612bd2d61",
    "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
    "https://images.unsplash.com/photo-1503602642458-232111445657",

    // Sports
    "https://images.unsplash.com/photo-1517849845537-4d257902454a",
    "https://images.unsplash.com/photo-1519315901367-f34ff9154487",
    "https://images.unsplash.com/photo-1599058917212-d750089bc07c",

    // Watches & Jewelry
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
    "https://images.unsplash.com/photo-1533236897111-3e94666b2edf",
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30",

    // Furniture
    "https://images.unsplash.com/photo-1493666438817-866a91353ca9",
    "https://images.unsplash.com/photo-1519710164239-da123dc03ef4",

    // Bags
    "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
    "https://images.unsplash.com/photo-1526170700256-5b6a493b5dc2",

    // More Clothing
    "https://images.unsplash.com/photo-1527613426441-4da17471b66d",
    "https://images.unsplash.com/photo-1524312153132-cc2d78f2f117",
    "https://images.unsplash.com/photo-1520975918318-3a9c9c2a89c2",
  ];

  String productTitles() {
    List<String> productTitles = [
      "Classic T-Shirt",
      "Premium Hoodie",
      "Running Shoes",
      "Smart Watch",
      "Laptop Backpack",
      "Wireless Earbuds",
      "Slim Fit Jeans",
      "Cargo Pants",
      "Leather Wallet",
      "Sports Jacket",
      "Baseball Cap",
      "Bluetooth Speaker",
      "Desk Lamp",
      "Gaming Mouse",
      "Wireless Keyboard",
      "Noise Cancelling Headphones",
      "Polo Shirt",
      "Sports Bottle",
      "Travel Bag",
      "Sunglasses",
      "Cotton Shirt",
      "Winter Coat",
      "Puffer Jacket",
      "Denim Jacket",
      "Hand Cream",
      "Face Moisturizer",
      "Night Serum",
      "Hair Oil",
      "Perfume Spray",
      "Luxury Watch",
      "Silver Bracelet",
      "Gold Necklace",
      "Phone Case",
      "Tablet Stand",
      "Power Bank",
      "USB-C Cable",
      "LED Strip Lights",
      "Mechanical Keyboard",
      "Office Chair",
      "Wooden Table",
      "Portable Fan",
      "Air Humidifier",
      "Yoga Mat",
      "Fitness Gloves",
      "Running Shorts",
      "Compression Shirt",
      "Cycling Gloves",
      "Laptop Cooling Pad",
      "Men’s Boots",
      "Women’s Heels",
      "Casual Sneakers",
      "Slip-on Shoes",
      "Sports Backpack",
      "Mini Speaker",
      "Digital Thermometer",
      "Kitchen Knife Set",
    ];
    return productTitles[_random.nextInt(productTitles.length)];
  }

  String randomDescription() {
    List<String> productDescriptions = [
      "High-quality premium product.",
      "Designed for comfort and durability.",
      "Top-selling item with excellent customer feedback.",
      "Lightweight, stylish, and easy to wear.",
      "Made from premium materials for long-lasting use.",
      "Perfect for daily wear and casual outings.",
      "Modern and elegant design suitable for everyone.",
      "Reliable performance with enhanced build quality.",
      "Trendy and fashionable — perfect for every season.",
      "Guaranteed long-lasting durability.",
      "Soft-touch fabric for maximum comfort.",
      "Sweat-resistant and breathable.",
      "Ideal for sports, travel, and everyday use.",
      "A must-have accessory for your wardrobe.",
      "Ergonomic design for maximum comfort.",
      "High precision and fast response.",
      "Fast charging and long battery life.",
      "Premium sound quality with deep bass.",
      "Water-resistant and durable.",
      "Minimalist and stylish look.",
      "Perfect for gym, running, and outdoor sports.",
      "Elegant design for special occasions.",
      "Crafted with care for a luxury finish.",
      "Suitable for all skin types.",
      "Soft and gentle moisturizer.",
      "Instant hydration and freshness.",
      "Perfect gift for friends and family.",
      "Improves posture with ergonomic support.",
      "Easy to clean and maintain.",
      "Firm yet comfortable cushion.",
      "Keeps your essentials safe and organized.",
      "Crystal-clear audio clarity.",
      "Shock-absorbing and durable material.",
      "Lightweight construction for easy portability.",
      "Advanced cooling technology.",
      "Heat-resistant, scratch-proof surface.",
      "Elegant wooden design for modern homes.",
      "Perfect for small and large rooms.",
      "Provides natural brightness and warmth.",
      "A daily essential for all outfits.",
      "Built for performance and endurance.",
      "Super soft fabric with premium stitching.",
      "Long-lasting fragrance with a smooth scent.",
      "Reduces fine lines and brightens skin.",
      "Natural ingredients with zero parabens.",
      "Improves airflow and breathing.",
      "Powerful motor with silent operation.",
      "High-efficiency battery capacity.",
      "Sturdy steel frame for extra durability.",
      "Slip-resistant rubber outsole.",
      "Quick-drying material.",
      "Compact size without compromising performance.",
      "Perfect for professional and casual use.",
      "Stylish design with premium finishes.",
      "Eco-friendly and sustainable materials.",
      "Breathable mesh fabric for ventilation.",
      "Shockproof technology for device protection.",
      "Strong and flexible cable build.",
      "Ideal for home offices and gaming setups.",
      "Built to enhance productivity.",
      "Perfect for workouts and training.",
      "Easy storage with foldable design.",
      "High-resolution sound output.",
      "Ultra-bright illumination for workspaces.",
      "Heavy-duty build with long lifespan.",
      "Accurate temperature readings.",
      "Chef-grade stainless steel blades.",
      "Ergonomic grip for comfortable use.",
      "Exceptional quality at an affordable price.",
      "Advanced wireless connectivity.",
      "Comfortable padding for extra support.",
      "Vibrant color with fade-resistant finish.",
      "Perfect fit for modern style.",
      "Smooth fabric that feels great on the skin.",
      "Premium stitching and detailing.",
      "Enhanced protection for your belongings.",
    ];
    productDescriptions.shuffle();
    return productDescriptions.take(5).toString();
  }

  List<String> randomImages() {
    productImages.shuffle();
    return productImages.take(10).toList();
  }

  List<String> randomSizes() {
    sizes.shuffle();
    return sizes.take(5 + _random.nextInt(5)).toList(); // 5 to 7 sizes
  }

  DateTime randomDate() {
    return DateTime.now().subtract(
      Duration(days: _random.nextInt(365), hours: _random.nextInt(24)),
    );
  }

  List<Products> generateRandomProducts() {
    return List<Products>.generate(10, (_) {
      return Products(
        title: productTitles(),
        description: randomDescription(),
        price: _random.nextDouble() * 495 + 5,
        images: randomImages(),
        quantity: _random.nextInt(1000) + 1,
        sizes: randomSizes(),
        favored: true,
        created_at: randomDate(),
        updated_at: randomDate(),
        deleted_at: null,
      );
    });
  }
}

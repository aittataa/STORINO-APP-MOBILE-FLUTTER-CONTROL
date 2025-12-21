enum Products_ {
  products,
  id,
  title,
  description,
  price,
  images,
  quantity,
  sizes,
  favored,
  created_at,
  updated_at,
  deleted_at,
}

class Products {
  late String? id;
  late String? title;
  late String? description;
  late double price;
  late int quantity;
  late bool favored;
  late List<String> images;
  late List<String> sizes;
  late DateTime? created_at;
  late DateTime? updated_at;
  late DateTime? deleted_at;

  Products({
    this.id,
    this.title,
    this.description,
    this.price = 0.0,
    this.quantity = 0,
    this.favored = false,
    this.images = const <String>[],
    this.sizes = const <String>[],
    this.created_at,
    this.updated_at,
    this.deleted_at,
  });

  factory Products.fromMap(Map<String, dynamic> data) {
    return Products(
      id: data[Products_.id.name],
      title: data[Products_.title.name] ?? false,
      description: data[Products_.description.name],
      price: data[Products_.price.name],
      quantity: data[Products_.quantity.name],
      favored: data[Products_.favored.name],
      sizes: data[Products_.sizes.name] == null ? <String>[] : List<String>.from(data[Products_.sizes.name].map((dynamic x) => x.toString())).toSet().toList(),
      images: data[Products_.images.name] == null ? <String>[] : List<String>.from(data[Products_.images.name].map((dynamic x) => x.toString())).toSet().toList(),
      created_at: data[Products_.created_at.name] == null ? null : data[Products_.created_at.name].toDate(),
      updated_at: data[Products_.updated_at.name] == null ? null : data[Products_.updated_at.name].toDate(),
      deleted_at: data[Products_.deleted_at.name] == null ? null : data[Products_.deleted_at.name].toDate(),
    );
  }

  Map<String, dynamic> get toMap {
    return <String, dynamic>{
      Products_.id.name: id,
      Products_.title.name: title,
      Products_.description.name: description,
      Products_.price.name: price,
      Products_.quantity.name: quantity,
      Products_.favored.name: favored,
      Products_.sizes.name: sizes,
      Products_.images.name: images,
      Products_.created_at.name: created_at,
      Products_.updated_at.name: updated_at,
      Products_.deleted_at.name: deleted_at,
    };
  }
}

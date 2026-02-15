class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      image: json['thumbnail'] ?? "", // 👈 أهم سطر
    );
  }
}
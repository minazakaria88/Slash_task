import 'package:equatable/equatable.dart';

class Product extends Equatable {
  late final int id;
  late final String name;
  late final String description;
  final List<ProductVariations> productVariations = [];
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    json['ProductVariations'].forEach((e) {
      productVariations.add(ProductVariations.fromJson(e));
    });
  }
  @override
  List<Object?> get props => [];
}

class ProductVariations {
  late final int id;
  late final int productId;
  late final int price;
  late final int quantity;
  final List<ProductVariantImages> images = [];
  ProductVariations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    json['ProductVarientImages'].forEach((e) {
      images.add(ProductVariantImages.fromJson(e));
    });
  }
}

class ProductVariantImages {
  late final int id;
  late final String imagePath;

  ProductVariantImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
  }
}

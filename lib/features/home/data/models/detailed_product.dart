class DetailedProduct {
  late final int id;
  late final String name;
  late final String description;
  late final String brandName;
  late final String brandImage;
  List<Variations> variations=[];
  DetailedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brandName = json['brandName'];
    brandImage = json['brandImage'];
    json['variations'].forEach((e){
      variations.add(Variations.fromJson(e));
    });
  }
}

class Variations {
  late final int price;
  List<ProductVarientImages> productVarientImages = [];
  List<ProductPropertiesValues> productPropertiesValues = [];
  Variations.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    json['ProductVarientImages'].forEach((e) {
      productVarientImages.add(ProductVarientImages.fromJson(e));
    });

    json['productPropertiesValues'].forEach((e) {
      productPropertiesValues.add(ProductPropertiesValues.fromJson(e));
    });
  }
}

class ProductVarientImages {
  late final int id;
  late final String imagePath;
  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
  }
}

class ProductPropertiesValues {
  late final String property;
  late final String value;
  ProductPropertiesValues.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    value = json['value'];
  }
}

class Product {
  final String id;
  final String name;
  final String currentPrice;
  final String actualPrice;
  final String discount;
  final List<String> image;
  final String? bottleholder;
  final String? brakes;
  final List<String>? colors;
  final String? expertiseLevel;
  final String? frameMaterial;
  final String? frameSize;
  final String? gears;
  final String? gender;
  final String? type;
  final String? suspension;
  final String? tyreSize;
  final String? weight;

  Product({
    required this.id,
    required this.name,
    required this.currentPrice,
    required this.actualPrice,
    required this.discount,
    required this.image,
    this.bottleholder,
    this.brakes,
    this.colors,
    this.expertiseLevel,
    this.frameMaterial,
    this.frameSize,
    this.gears,
    this.gender,
    this.type,
    this.suspension,
    this.tyreSize,
    this.weight,
  });
}

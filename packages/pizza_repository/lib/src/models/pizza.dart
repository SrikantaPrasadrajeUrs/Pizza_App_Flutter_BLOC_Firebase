class Pizza {
  final String imagePath;
  final bool isVeg;
  final String name;
  final double price;
  final double spicy;
  final String description;

  Pizza({
    required this.description,
    required this.imagePath,
    required this.isVeg,
    required this.name,
    required this.price,
    required this.spicy,
  });

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'isVeg': isVeg,
      'name': name,
      'price': price,
      'spicy': spicy,
      'description': description,
    };
  }

  // fromJson method
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      imagePath: json['imagePath'],
      isVeg: json['isVeg'],
      name: json['name'],
      price: json['price'],
      spicy: json['spicy'],
      description: json['description'],
    );
  }

  @override
  String toString() {
    return "Pizza: name:$name isVeg: $isVeg desc:$description price:$price spicy:$spicy";
  }
}

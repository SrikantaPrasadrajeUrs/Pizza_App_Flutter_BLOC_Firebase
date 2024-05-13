class MyUserEntity {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  MyUserEntity(
      {required this.name,
      required this.email,
      required this.hasActiveCart,
      required this.userId});

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart
    };
  }

  static MyUserEntity fromJson(Map<String, dynamic> json) {
    return MyUserEntity(
        name: json['name'],
        email: json['email'],
        hasActiveCart: json['hasActiveCart'],
        userId: json['userId']);
  }
}

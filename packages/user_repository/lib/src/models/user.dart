import '../entities/entities.dart';

export 'user.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool hasActiveCart;
  MyUser(
      {required this.name,
      required this.email,
      required this.hasActiveCart,
      required this.userId});

  static final empty =
      MyUser(name: '', email: '', hasActiveCart: false, userId: '');

  MyUserEntity toEntity() {
    return MyUserEntity(name: name, email: email, hasActiveCart: hasActiveCart, userId: userId);
  }

  static MyUser formEntity(MyUserEntity entity){
    return MyUser(name: entity.name, email: entity.email, hasActiveCart: entity.hasActiveCart, userId: entity.userId);
  }

  @override
  String toString(){
    return 'MyUser: $userId, $name $email, $hasActiveCart';
  }
}

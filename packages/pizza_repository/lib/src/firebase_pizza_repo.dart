import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePizzaRepo{
  final pizzaCollection = FirebaseFirestore.instance.collection("pizzas");
}
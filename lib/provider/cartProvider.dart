import 'package:flutter/material.dart';


class Cartprovider extends ChangeNotifier{

  final List<Map<String,dynamic>> _cartItems =[];
  List<Map<String,dynamic>> get cartItems =>_cartItems;

  void addToCart(Map<String,dynamic> product){
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  int get totalItems => _cartItems.length;
}

class CartProvider extends ChangeNotifier{

  final List<Map<String,dynamic>> _cartItems =[];
  List<Map<String,dynamic>> get cartItems =>_cartItems;

  void addToCart(Map<String,dynamic> product){
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  int get totalItems => _cartItems.length;
}
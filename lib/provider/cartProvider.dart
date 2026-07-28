import 'package:flutter/material.dart';
import'package:flutter_application_2/model/model.dart';

class Cartprovider extends ChangeNotifier{

  final List<Product> _cartItems=[];
  List<Product> get cartItems => _cartItems;

  void addToCart(Product product){
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  int get totalItems => _cartItems.length;
}


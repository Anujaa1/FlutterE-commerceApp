import 'package:flutter/material.dart';


class WishlistProvider extends ChangeNotifier{

  final List<Map<String,dynamic>> _wishlistItems =[];
  List<Map<String,dynamic>> get wishlistItems =>_wishlistItems;

  void addToWishlist(Map<String,dynamic> product){
    _wishlistItems.add(product);
    notifyListeners();
  }

  void removeFromWishlist(int index) {
    _wishlistItems.removeAt(index);
    notifyListeners();
  }

  int get totalItems => _wishlistItems.length;
}
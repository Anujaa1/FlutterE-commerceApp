import 'package:flutter/material.dart';
import'package:flutter_application_2/model/model.dart';



class WishlistProvider extends ChangeNotifier{

  final List<Product> _wishlistItems =[];
  List<Product> get wishlistItems => _wishlistItems;


  void addToWishlist(Product product){
    _wishlistItems.add(product);
    notifyListeners();
  }

  void removeFromWishlist(int index) {
    _wishlistItems.removeAt(index);
    notifyListeners();
  }

  int get totalItems => _wishlistItems.length;
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/services/api_service.dart';
import'package:flutter_application_2/model/model.dart';

class ProductProvider extends ChangeNotifier{
  final ApiService api =ApiService();
  List<Product>products=[];
  bool loading=false;
  Future<void> getProducts()async{
    loading=true;
    notifyListeners();
    products =await api.fetchProducts();
    loading=false;
    notifyListeners();
  }
}
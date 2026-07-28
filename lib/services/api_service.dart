import'dart:convert';
import'package:http/http.dart' as http;
import'package:flutter_application_2/model/model.dart';

class ApiService{
  Future<List<Product>> fetchProducts() async{
    final url=Uri.parse(
      "https://fakestoreapi.com/products",
    );
    final response=await http.get(url);
    if( response.statusCode==200){
      final List jsonData=
          jsonDecode(response.body);
      return jsonData
          .map((e)=> Product.fromJson(e))
          .toList();
    }
    else{
      throw Exception('Failed');
    }
  }
}
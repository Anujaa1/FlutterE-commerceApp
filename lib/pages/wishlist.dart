import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/WishlistProvider.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<WishlistProvider>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Wishlist", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
        ),

        body: cart.wishlistItems.isEmpty?Center(
            child: Text("Wishlist is empty")
        ): ListView.builder(
            itemCount: cart.wishlistItems.length,
            itemBuilder: (context,index){
              final product =cart.wishlistItems[index];

              return ListTile(
                leading: Image.network(
                  product.image,
                  width: 60,
                ),
                title: Text(product.name),
                subtitle: Text(product.price),
                trailing: IconButton(
                    onPressed: (){
                      cart.removeFromWishlist(index);
                    },
                    icon: Icon(Icons.delete)),
              );
            })
    );
  }
}
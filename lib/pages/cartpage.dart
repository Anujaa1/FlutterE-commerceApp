import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/cartProvider.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cartprovider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Cart",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: cart.cartItems.isEmpty
          ? Center(
          child: Text("Cart is empty")
      )

          : ListView.builder(
          itemCount: cart.cartItems.length,

          itemBuilder: (context,index){

            final product = cart.cartItems[index];

            return ListTile(
              leading: Image.network(
                product.image,
                width: 60,
              ),

              title: Text(product.name),

              subtitle: Text(product.price),

              trailing: IconButton(
                onPressed: (){
                  cart.removeFromCart(index);
                },
                icon: Icon(Icons.delete),
              ),
            );
          }
      ),
    );
  }
}
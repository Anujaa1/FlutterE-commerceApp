import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/cartProvider.dart';
import'package:flutter_application_2/provider/WishlistProvider.dart';
import 'package:provider/provider.dart';

class Detailpage extends StatefulWidget {
  final Map<String, dynamic> productDetail;
  const Detailpage({super.key,required this.productDetail});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  bool isFavourite=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.favorite),
              color: isFavourite ? Colors.red : Colors.grey,
              onPressed: () {
                Provider.of<WishlistProvider>(context,listen: false).addToWishlist(widget.productDetail);

        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Product added to Wishlist")));
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary
                  ),
                  onPressed: (){
                    Provider.of<Cartprovider>(context,listen: false).addToCart(widget.productDetail);

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Product added to cart"))
                    );
                  },
                  child: Text("Add Cart", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),)),
            ),

            SizedBox(width: 10,),

            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary
                  ),
                  onPressed: (){},
                  child: Text("Buy now",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),)),
            )
          ],
        ),
      ),

      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 16/14,
                      child: Image.network(widget.productDetail["image"]??"",
                        height: 350,
                        fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12,),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productDetail["name"]??"",
                      style: TextStyle(
                          fontSize: 24,fontWeight: FontWeight.bold
                      ),),

                    SizedBox(height: 10,),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.productDetail["price"].toString()??"", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary
                            ),),

                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber,),
                                SizedBox(width: 6,),
                                Text(widget.productDetail["rating"].toString())
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),

                    SizedBox(height: 15,),

                    Container(
                        decoration: BoxDecoration(
                            color: Colors.orange.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              Text("Description", style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),),

                              SizedBox(height: 10,),

                              Text(widget.productDetail["description"]?.toString()??"",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:Colors.black
                                ),),
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/model.dart';
import 'package:flutter_application_2/pages/cartpage.dart';
import 'package:flutter_application_2/pages/homepage.dart';
import 'package:flutter_application_2/pages/profilepage.dart';
import 'package:flutter_application_2/pages/wishlist.dart';
import'package:flutter_application_2/provider/productProvider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_2/pages/detailPage.dart';
import 'package:flutter_application_2/pages/bottomNavBar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override

  State<Homepage> createState() => _HomepageState();
}
TextEditingController searchController=TextEditingController();

List<String>imageList=[
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-hum-rXy1P7NwEY6AdwzGBvNHQDHeG1tv9oNUqpEUw&s=10",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVYuh3vcAOD5LLOVBRVkgfIcVQpytyv9kXlHJTRunnew&s=10",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7yrM2fFZzOFuZWMpnoAHYkALKNw982XOPpCOKTLLnig&s=10",

];


class _HomepageState extends State<Homepage> {
  List<Product> displayedProducts = [];
  @override
  void initState() {
    super.initState();
    Future.microtask((){
    context.read<ProductProvider>().getProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final products = provider.products;
    List<Widget> pages =[

      Bottomnavbar(
        username: "",
        email: "",
      ),

    ];

    void searchProducts(String query){
      setState(() {

        if(displayedProducts.isEmpty){
          displayedProducts = provider.products;
        }else{
        final searchedProducts = provider.products.where(
              (product) =>
              product.name
                  .toLowerCase()
                  .contains(query.toLowerCase()),
        ).toList();

      }

      });
    }


    return
      Scaffold(

      body:  SafeArea(child:Padding (
        padding:const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
          controller:searchController,
            onChanged: searchProducts,
            decoration:InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
                hintText: "Search here...",
              suffixIcon:Icon(Icons.search)
            ),
          ),

          Expanded(child: SingleChildScrollView(
            child:Column(
              children:[
                CarouselSlider(items: imageList.map((item){
                  return Builder(builder: (BuildContext context) {
                    return Image.network(item);
                  });
                }).toList(),
                    options:CarouselOptions(
                        enlargeCenterPage: true,
                        aspectRatio: 0.9,
                        autoPlay: true,
                        autoPlayInterval:Duration(seconds: 15)
                    )),

              ListTile(
              leading:Text("Our Products",style: TextStyle(
    fontSize:10,
    fontWeight:FontWeight.bold
    ),),
    trailing: Container(
    decoration:BoxDecoration(
    color: Theme.of(context).colorScheme.secondary,
    borderRadius:BorderRadius.circular(50)
    ),

    child: Icon(Icons.arrow_forward , color:Colors.white),
    ),
    ),
    GridView.builder(

    shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

    crossAxisSpacing:10,
    mainAxisSpacing:10,
    crossAxisCount:2,
    childAspectRatio:0.5,
    ),

    itemCount:products.length,

    itemBuilder:(context,index){
      final item = products[index];
      return GestureDetector(
          onTap:(){
            Navigator.push(context,MaterialPageRoute(
                builder: (context)=> Detailpage(productDetail:item)));
          },
        child: Container(
            decoration:BoxDecoration(
            color:Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
            children:[
            ClipRRect(
            borderRadius:BorderRadius.only(topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),

            child: Image.network(item.image,
            height:150,
            width:MediaQuery.of(context).size.width,
            fit: BoxFit.cover,),),
        Padding(
            padding: const EdgeInsets.all(10),
            child:Column(
            children:[
            Text(item.name,style:TextStyle(
            fontSize:13,
            fontWeight: FontWeight.bold
            ),),
            SizedBox(height:6,),
            Text(item.price,style:TextStyle(//toString()// checking with null operator
        fontSize:12,
        fontWeight:FontWeight.bold,
          color:Theme.of(context).colorScheme.primary
            ),),

            Row(
            children:[
            Icon(Icons.star,color:Colors.amber,),
            SizedBox(width:4,),
            Text(item.rating.toString(),style:TextStyle(
            fontSize:14,
            fontWeight:FontWeight.bold
            ))
            ]
            ),



            ]


            ),)

            ],),),
      );

    }
    ),
    ]
            )
          ))
        ],
      )),

      ), );
  }
}

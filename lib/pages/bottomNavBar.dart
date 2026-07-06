import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/cartpage.dart';
import 'package:flutter_application_2/pages/homepage.dart';
import 'package:flutter_application_2/pages/profilepage.dart';
import 'package:flutter_application_2/pages/wishlist.dart';

class Bottomnavbar extends StatefulWidget {
  final String username;
  final String email;
  const Bottomnavbar({ super.key,
    required this.username,
    required this.email,});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

int currentIndex = 0;
class _BottomnavbarState extends State<Bottomnavbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    List<Widget> pages =[
      Homepage(),
      CartPage(),

      Wishlistpage(),
      Profilepage(
        username: widget.username,
        email: widget.email,
      ),

    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value){
            setState(() {
              currentIndex=value;
            });
          },
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,

          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 20,), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, size: 20,), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border, size: 20,), label: 'Wishlist'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 20,  ), label: 'Profile'),
          ]),

      body:pages[currentIndex] ,
    );
  }
}

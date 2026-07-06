import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/create.dart';

class Profilepage extends StatefulWidget {
  final String username;
  final String email;

  const Profilepage({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 22,color:Colors.purple,fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
          child: Center (
              child: Padding(
                padding: const EdgeInsets.all(50),
                  child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                              Text("User Details",
                              style: TextStyle(color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),

                            SizedBox(height: 10,),


                            Center(
                              child: Container(
                                width:80,
                                height:80,

                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA_mvwMevT_skzUZvO1t4Jz--DtYNB2P4ouCQPmvpRbA&s",
                                  fit: BoxFit.cover,
                                ),
                              ),

                            ),SizedBox(height: 20),

                                  Container(
                                      decoration: BoxDecoration( color: Colors.yellow.shade100),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child: Text( "@${widget.username}", style: textStyle,)),
                                    ],
                                  )),

                               Text(widget.email,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                             ] ),
                          )),),),)


      )
    );
  }
}
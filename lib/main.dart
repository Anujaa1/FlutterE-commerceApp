import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/create.dart';
import 'package:flutter_application_2/pages/create.dart';
import 'package:flutter_application_2/provider/cartProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_)=>Cartprovider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              primary: Colors.redAccent,
              secondary: Colors.blueAccent
          )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CreateAccountPage(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/create.dart';
import 'package:flutter_application_2/pages/create.dart';
import 'package:flutter_application_2/pages/welcome.dart';
import 'package:flutter_application_2/provider/cartProvider.dart';
import 'package:flutter_application_2/provider/WishlistProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cartprovider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: WelcomePage(),
    );
  }
}
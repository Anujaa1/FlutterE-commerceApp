import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/homepage.dart';
import 'package:flutter_application_2/pages/profilepage.dart';
import'package:flutter_application_2/pages/bottomNavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateaccountpageState();
}

TextEditingController usernameController =TextEditingController();
TextEditingController emailController =TextEditingController();
TextEditingController passwordController =TextEditingController();

Future<void> signUp() async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );
}
class _CreateaccountpageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {

    RegExp emailExp =RegExp(
        r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
    );

    Future <void> validation()async{
      String username =usernameController.text.trim();
      String email =emailController.text.trim();
      String password =passwordController.text.trim();
      if(username.isEmpty || email.isEmpty || password.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Field Cannot be empty"))
        );
      }
      else if(password.length <4){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Password is too short"))
        );
      }
      else if(!emailExp.hasMatch(email)){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email is invalid"))
        );
      }
      await signUp();
      Navigator.push(context,
              MaterialPageRoute(
                  builder: (context)=>Bottomnavbar(
                    username: username,
                    email: email,
                  ),

              ));
    }

    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Create Your Account Now!",
                      style: TextStyle(color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 8,),

                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter username",
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),

                    const SizedBox( height: 9),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email",hintStyle: TextStyle(fontSize: 12)
                      ),
                    ),

                    const SizedBox( height: 9),

                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter password"
                      ),
                    ),

                    const SizedBox(height: 9,),

                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(20)
                              )
                          ),
                          onPressed: (){
                            validation()
                            ;
                          },
                          child: Text("Create Account",
                            style:TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                            ) ,)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

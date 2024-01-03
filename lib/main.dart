import 'package:chat/src/screens/Homescreen.dart';
import 'package:chat/src/screens/chatpage.dart';
import 'package:chat/src/screens/forgottenpassword.dart';
import 'package:chat/src/screens/loginpage.dart';
import 'package:chat/src/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {


  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lets Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade700),
        useMaterial3: true,
      ),
      home:  const LoginPage(),
      getPages: [
        GetPage(name: '/', page:()=>const LoginPage()),
        GetPage(name: '/', page:()=>const SignUp()),
        GetPage(name: '/', page:()=>const Forgotpg()),
        GetPage(name: '/', page:()=>const Homescreen()),
        GetPage(name: '/', page:()=>ChatPage(name: "", profileurl: "", username: "")),
      ],
    );
  }
}



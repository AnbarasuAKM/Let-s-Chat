import 'package:chat/src/screens/Homescreen.dart';
import 'package:chat/src/screens/loginpage.dart';
import 'package:chat/src/service/SharedPreferance.dart';
import 'package:chat/src/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUp> {
  String email = "", password = "", name = "";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emialcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registartion() async {
    if (password != null &&
        namecontroller.text != "" &&
        emialcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        //2
        String Id =randomAlphaNumeric(10);


        //1
        Map<String,dynamic>userInfoMap= {
          "Name": namecontroller.text,
          "Email":emialcontroller.text,
          "Username":emialcontroller.text.replaceAll("@gmail.com", ""),
          "photo":"https://icons-for-free.com/iconfiles/png/512/avatar+user+account+confirm+approve+complete-1320567854562615796.png",
          "Id":Id,
        };
        await DatabaseMethods().addUserDetails(userInfoMap, Id);
        await SharedPreferenceHelper().saveUserId(Id);
        await SharedPreferenceHelper().saveUserDisplayName(namecontroller.text);
        await SharedPreferenceHelper().saveUserEmail(emialcontroller.text);
        await SharedPreferenceHelper().saveUserPic("https://icons-for-free.com/iconfiles/png/512/avatar+user+account+confirm+approve+complete-1320567854562615796.png");
        await SharedPreferenceHelper().saveUserName(emialcontroller.text.replaceAll("@gmail.com", ""),);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registred Succesfully",style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white,fontSize: 10),)));
        Get.to(Homescreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.teal,
              content: Text("Password provided is too weak")));
        } else if (e.code == 'email-already in used') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text("Account Already exists")));
        }
      }
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6eefe),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://img.freepik.com/premium-vector/dialogue-people-communication-characters-web-chat-discuss-businessman-active-discussion-flat-pictures_80590-6162.jpg",
                ),
                fit: BoxFit.fitHeight),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black54,
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Signup",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Name";
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.account_circle,
                          color: Colors.teal,
                        ),
                        hintText: "Name",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Tuesday",
                            color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.white10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white10,
                        )),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter Email";
                        }
                        return null;
                      },
                      controller: emialcontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: const Icon(
                          Icons.mail,
                          color: Colors.teal,
                        ),
                        hintText: "Enter Email",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Tuesday",
                            color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.white10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white10,
                        )),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please Enter password";
                        }
                        return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.lock,
                          color: Colors.teal,
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Tuesday",
                            color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.white10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white10,
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = emialcontroller.text;
                            name = namecontroller.text;
                            password = passwordcontroller.text;
                          });
                          registartion();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.teal),
                          child: const Center(
                              child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              color: Colors.white,
                              height: 2,
                            ),
                            Text(
                              "Or signUp with",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                            ),
                            Container(
                              width: 120,
                              color: Colors.white,
                              height: 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black38,
                              ),
                              child: Icon(
                                Icons.apple,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black38,
                              ),
                              child: Icon(
                                Icons.facebook_sharp,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black38,
                              ),
                              child: Icon(
                                Icons.android,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account  !!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(LoginPage());
                              },
                              child: Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.tealAccent),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
// void loginpg()async{
//   String email=emialcontroller.text;
//   String password=passwordcontroller.text;
//
//   User? user= await _auth.signUpwithEmailandPassword(email,password);
//
//   if (user==null){
//     print("user is succesfully created");
//     Get.toNamed(Homescreen().toString());
//   }else{
//     print("some erroe happend");
//   }
// }
// }

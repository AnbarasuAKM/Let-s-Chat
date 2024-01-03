import 'package:flutter/material.dart';

class Forgotpg extends StatefulWidget {
   const Forgotpg({super.key});

  @override
  State<Forgotpg> createState() => _ForgotpgState();


}

class _ForgotpgState extends State<Forgotpg> {


  String email="";
  TextEditingController emailcontroller=TextEditingController();

  final _formkey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 330,
                  width: 330,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: NetworkImage("https://img.freepik.com/free-vector/forgot-password-concept-illustration_114360-1095.jpg"),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.transparent
                  ),
                ),
                Text("Forgot Your Password ?",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                Text(
                  "Enter your Email below to recevie your password \n reset instruction !!",textAlign: TextAlign.center
                  ,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
                Padding(
                  padding: const EdgeInsets.all(08.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter password";
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      fillColor: Colors.teal
                      ,
                      filled: true,
                      suffixIcon:  const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Tuesday",
                          color: Colors.white),
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
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 150, decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal),
                    child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

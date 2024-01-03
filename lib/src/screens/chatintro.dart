import 'package:chat/src/screens/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chats extends StatelessWidget {
  Chats({Key? key}) : super(key: key);
  List x = [
    {
      "name": "Anbu",
      "img": "https://a.espncdn.com/photo/2022/1130/r1099444_1296x729_16-9.jpg"
    },
    {
      "name": "Lijo",
      "img": "https://a.espncdn.com/photo/2022/1130/r1099444_1296x729_16-9.jpg"
    },
    {
      "name": "Ganesh",
      "img": "https://a.espncdn.com/photo/2022/1130/r1099444_1296x729_16-9.jpg"
    },
    {
      "name": "Sree",
      "img": "https://a.espncdn.com/photo/2022/1130/r1099444_1296x729_16-9.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: x.isNotEmpty
          ? ListView.builder(
              itemCount: x.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(ChatPage(name: "", profileurl: "", username: ""));
                    // Get.to( Chatpage(name: x[index]["name"], img: x[index]["img"],));
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatpage(),),);
                  },
                  leading: GestureDetector(
                    onTap: () {
                      // Get.to(Chatpage(name: x[index]["name"], img:x[index]["img"],));
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(img: "")),);
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(x[index]["img"]),
                      radius: 25,
                    ),
                  ),
                  title: Text(x[index]["name"]),
                  subtitle: Row(
                    children: [
                      Icon(Icons.done_all),
                      Text("Hii"),
                    ],
                  ),
                  trailing: Text("10:52"),
                );
              })
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade700,
        onPressed: () {},
        child: Icon(
          Icons.chat,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}

// registartion()async{
//   if(password!=null && namecontroller.text!=""&&emialcontroller.text!=""){
//     try{
//       UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registred Succesfully")));
//       Get.to(Homescreen());
//     }on FirebaseAuthException catch(e){
//       if(e.code=='weak-password'){
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: Colors.orangeAccent,
//             content: Text("Password Provided is too weak")));
//       }
//       else if(e.code=="email-already in use")
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text("account already exists")));
//     }
//     }
//   }

import 'package:chat/shoping%20app/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List x = [
    {
      "img":
          "https://www.shutterstock.com/image-photo/stylish-room-interior-comfortable-furniture-260nw-1485045323.jpg",
      "Title": "1",
      "des": "nice"
    },
    {
      "img":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Ffurniture&psig=AOvVaw2vUHF-_dCGRHcUBOVRl8fO&ust=1704264266388000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCLjl56SNvoMDFQAAAAAdAAAAABAJ",
      "Title": "2",
      "des": "nice"
    },
    {
      "img":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Ffurniture&psig=AOvVaw2vUHF-_dCGRHcUBOVRl8fO&ust=1704264266388000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCLjl56SNvoMDFQAAAAAdAAAAABAJ",
      "Title": "3",
      "des": "nice"
    },
    {
      "img":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Ffurniture&psig=AOvVaw2vUHF-_dCGRHcUBOVRl8fO&ust=1704264266388000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCLjl56SNvoMDFQAAAAAdAAAAABAJ",
      "Title": "4",
      "des": "nice"
    },
    {
      "img":
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Ffurniture&psig=AOvVaw2vUHF-_dCGRHcUBOVRl8fO&ust=1704264266388000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCLjl56SNvoMDFQAAAAAdAAAAABAJ",
      "Title": "5",
      "des": "nice"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu_open_outlined),
                Icon(Icons.account_box_sharp),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 300,
                  height: 60,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child:
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Tuesday",
                            color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
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
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 360,
              width: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: x.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 120,
                        width: 220,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 230,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.teal,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.shutterstock.com/image-photo/stylish-room-interior-comfortable-furniture-260nw-1485045323.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              right: 10,
                              top: 220,
                              child: Container(
                                height: 100,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Item None",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
                                    Text("Just Looking Like a wow"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("\$220"),
                                        Icon(
                                          Icons.add,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Spacer(),
            Text("Best Selling",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 90,
                width: 340,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://www.shutterstock.com/image-photo/stylish-room-interior-comfortable-furniture-260nw-1485045323.jpg"                      ),
                    ),
                    title: Column(
                      children: [
                        Text("Miniminial Chair"),
                        Text("Loreum Ipsum"),
                        Text("\$2500"),
                      ],
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Get.to(Details());
                        },
                        icon: Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 30,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

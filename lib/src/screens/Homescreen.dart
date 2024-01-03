import 'package:chat/src/screens/chatintro.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({
    super.key,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  bool search=false;

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105),
        child:  AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          backgroundColor: Colors.teal.shade700,
          title: const Text(
            "Let's Chat",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.camera_alt,color: Colors.white,),
            ),
             Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(onPressed:(){
                search=true;
                setState(() {

                });
              },icon:const Icon(Icons.search,color: Colors.white,),
              )
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert,color: Colors.white,)),
          ],
          bottom:TabBar(
            unselectedLabelColor: Colors.grey.shade300,
            indicatorWeight: 3.5,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: const [
              Tab(
                child: Text(
                  "Chats",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Status",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Calls",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Chats(),
        Chats(),
        Chats(),

      ]),
    );
  }
}
import 'package:flutter/material.dart';
class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [Column(
          children: [
             Container(
               height: 450,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 image: const DecorationImage(
                     image: NetworkImage("https://img.freepik.com/premium-photo/stylish-concept-living-room-interior-with-small-walnut-table-design-chairs-tropical-leaf-beige-vase-retro-carpet-decoration-elegant-personal-accessories-modern-vintage-home-decor_431307-1119.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1703980800&semt=ais"),fit: BoxFit.cover),
                 borderRadius: BorderRadius.circular(0),
                 border: const Border(top: BorderSide.none,right: BorderSide.none)
               ),
             ),
          ],
        ),
          Positioned(
            top: 400,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 400,
              decoration: BoxDecoration(
                color: Color(0xfff9f9f9),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Column(
                children: [
                  Text("250"),
                ],
              ),

            ),
          ),
          Positioned(top: 380,left: 299,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: [BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, 3),blurRadius: 5.0
                  )],
                  color: Colors.white
                ),
                child: IconButton(
                  style: const ButtonStyle(),
                    onPressed: (){}, icon:const Icon(Icons.favorite_rounded,size: 30,color: Colors.red,)),
              )),
          Container(
            height: 450,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage("https://img.freepik.com/premium-photo/stylish-concept-living-room-interior-with-small-walnut-table-design-chairs-tropical-leaf-beige-vase-retro-carpet-decoration-elegant-personal-accessories-modern-vintage-home-decor_431307-1119.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1703980800&semt=ais"),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(0),
                border: const Border(top: BorderSide.none,right: BorderSide.none)
            ),
          ),

        ],
      ),
    );
  }
}

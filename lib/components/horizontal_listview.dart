import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
//          Category(imageLocation: "images/cats/tshirt.png",imageCaption: "tshirt",),
//          Category(imageLocation: "images/cats/jeans.png",imageCaption: "jeans",),
//          Category(imageLocation: "images/cats/informal.png",imageCaption: "informal",),
//      Category(imageLocation: "images/cats/formal.png",imageCaption: "formal",),
//      Category(imageLocation: "images/cats/dress.png",imageCaption: "dress",),
//
//          Category(imageLocation: "images/cats/shoe.png",imageCaption: "shoe",),
//        Category(imageLocation: "images/cats/accessories.png",imageCaption: "accessories",),






        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

Category({this.imageLocation,this.imageCaption});

  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2),
    child: InkWell(
      onTap: (){},
      child: Container(
        width: 100,
        child: ListTile(

          title: Image.asset(
            imageLocation,
            width: 100,
            height: 80,
          ),
          subtitle: Container(
            alignment: Alignment.topCenter,
            child : Text(imageCaption ,style: TextStyle(fontSize: 12),),
          )


        ),

      ),


    ),
    );
  }
}




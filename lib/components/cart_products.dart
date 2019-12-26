import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<dynamic> cartProductList = [

  {

    "name": "blazers",
    "picture": "images/products/blazer1.jpeg",
    "price": 1500,
    "size": "m",
    "color": "red"
  },
  {
    "name": "blazar242",
    "picture": "images/products/blazer2.jpeg",
    "size": "m",
    "price": 1400,
    "color": "red"
  }
];

class CartProducts extends StatefulWidget {







  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {










  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartProductList.length,
        itemBuilder: (context,index){
         return

           SingleCartItems (


           cartProdName: cartProductList[index]["name"],
           cartProdPicture:cartProductList[index]["picture"],
           cartProdSize: cartProductList[index]["size"],
           cartProdPrice: cartProductList[index]["price"],
           cartProdColor: cartProductList[index]["color"],



         );
          
        } );
  }
}


class SingleCartItems extends StatelessWidget {

  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  
  

  SingleCartItems({
    this.cartProdName,
    this.cartProdPicture,
    this.cartProdPrice,
    this.cartProdSize,
    this.cartProdColor
});
  
  
  
  Widget build(BuildContext context) {
    return Card(


       child: Container(


         child: Row(

           children: <Widget>[

             Image.asset(cartProdPicture,height: 80,width: 80,),
               
               Padding(
                 padding: const EdgeInsets.only(left: 5),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                     Text(cartProdName),
                   Row(

                     //========================SIZE AND COLOR IN CART ITEM CARD ================================


                     children: <Widget>[

                       //==============================size================================
                       Padding(padding: EdgeInsets.all(2),
                         child: Text("size:",style: TextStyle(color: Colors.grey),),),

                       Padding(padding: EdgeInsets.all(5),
                         child: Text(cartProdSize,style: TextStyle(color: Colors.red),),),

                       //==============================Color================================


                       Padding(padding: EdgeInsets.all(2),
                         child: Text("color:",style: TextStyle(color: Colors.grey),),),

                       Padding(padding: EdgeInsets.all(5),
                         child: Text(cartProdColor,style: TextStyle(color: Colors.red),),),

                       //==============================PRICE ============================


                     ],
                   ),

                   Container(
                     alignment: Alignment.topLeft,
                     child: Text("₹$cartProdPrice",style: TextStyle(
                         fontSize: 17,
                         fontWeight: FontWeight.w500
                         ,
                         color: Colors.red),

                     ),

                   ),




                 ],

             ),
               ),

             SizedBox(width: 80,),

             Container(
               child: Column(
                 children: <Widget>[

                   IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){


                   }),
                   Text("2",style: TextStyle(),),
                   IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})



                 ],



               ),

             )


           ],




         ),




       ),



    );
  }
}

class ItemAdder {

  final name ;
  final picture ;
  final price;
  final color;
  final size;



  ItemAdder({this.name,this.price ,this.picture ,this.color: "red",this.size: "m"}) {
    var singleCartDataGenerator = {
      "name": name,
      "picture": picture,
      "price": price,
      "size": "m",
      "color": "red"
    };

    cartProductList.add(singleCartDataGenerator);


    print(cartProductList);
  }


}

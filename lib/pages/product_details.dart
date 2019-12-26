import 'dart:convert';

import 'package:desistore/models/cartModel.dart';
import 'package:desistore/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:desistore/components/Products.dart';
import 'package:desistore/components/cart_products.dart';
import 'package:desistore/components/provider_items.dart';
import 'package:provider/provider.dart';
import 'orderDetailsPage.dart';
import 'cartItemBottomSheet.dart';

int totalFoodItemPrice = 0;

List<dynamic> cartItemsList = [
];

class ProductDetails extends StatefulWidget {

  final detailProductName;
  final detailProductPicture;
  final detailProductoldPrice;
  final detailProductPrice;
  final detailLocationProvider;
  final detailProviFoodItems;

  ProductDetails({this.detailProductName,
    this.detailProductPicture,
    this.detailProductoldPrice,
    this.detailProductPrice,
    this.detailLocationProvider,
    this.detailProviFoodItems});


  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails> {


  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Lunch Box"),
          backgroundColor: Colors.red,
          actions: <Widget>[

            IconButton(icon: Icon(Icons.search, color: Colors.white,)),
            IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,),
                onPressed: () {})

          ],


        ),

        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                // ==========================Buy Now Button ========================


                Row(children: <Widget>[
                  Container(
                    child:
                    Row(
                      children: <Widget>[
                        Container(
                          width: 70,
                          child: Text("${cartModel.totalPrice} ₹",
                            style: TextStyle(fontSize: 20, color: Colors.red),),
                        ),


                        Stack(
                          children: <Widget>[

                          IconButton(icon: Icon(Icons.shopping_cart,size: 30,color: Colors.black54,), onPressed:
                          //===========================cartButton Listener ===========

                              (){

//                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
//                            =>HomeView()


//                            ));

                              showModalBottomSheet(context: context,backgroundColor: Colors.transparent, builder: (builder){

                                return  CartItemBottomSheet();


                              }

                              );




                          }

                          ),

                            Positioned(

                                child: new Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left:20),
                                      child: new Icon(
                                          Icons.brightness_1,
                                          size: 23.0, color: Colors.yellow[800]),
                                    ),
                                    new Positioned(
                                        top: 5.0,
                                        right: 4.0,
                                        child: new Center(
                                          child: new Text(
                                            cartModel.foodItemsList.length.toString(),
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        )),


                                  ],
                                ))




                          ],


                        ),

                        
                      ],
                    ),
                  ),


                ],),


                MaterialButton(

                    color: Colors.redAccent,
                    elevation: 0.2,
                    child: Text(
                      "Order Now >", style: TextStyle(color: Colors.white),),
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)
                      => OrderDetails()));
                    }),


              ],


            ),
          ),

        ),


        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(


                height: 250,

                child: GridTile(

                  child: Image.network(
                    widget.detailProductPicture, fit: BoxFit.cover,),
                  footer: Container(height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                        )),


                      child: Container(

                          child:Row(children: <Widget>[
                            new Flexible(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[


                                     Expanded(
                                       child: Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 5),
                                        child: Row(
                                          children: <Widget>[
                                          Container(

                                            height: 25,

                                            child:   Image.asset("images/IconAssets/baker.png",height: 30,),
                                          ),
                                            Flexible(
                                              child: Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:10.0),
                                                  child: Text(widget.detailProductName,overflow: TextOverflow.ellipsis,style: TextStyle(
                                                    fontSize: 20,color: Colors.black87
                                                  ),),
                                                ),

                                              ),
                                            )

                                          ],
                                        ),
                                    ),
                                     ),


                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 5),
                                      child: Row(
                                        children: <Widget>[

                                          Container(

                                            height: 25,

                                            child:   Image.asset("images/IconAssets/map.png",height: 30,),
                                          ),

                                          Flexible(
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:10.0),
                                                child: Text(widget.detailLocationProvider,overflow: TextOverflow.ellipsis,style: TextStyle(
                                                    fontSize: 16,color: Colors.black87
                                                ),
                                                ),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),




                                ],
                              ),
                            ),

                         Padding(
                           padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                           child: Container(


                             child: Icon(Icons.info_outline,size: 30,color: Colors.orange,),
                           ),
                         )

                          ])

                      )


                  ),


                ),
              ),

              Divider(
                thickness: 1,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Food items ", style: TextStyle(fontSize: 17),),
              ),


              Expanded(
                child: Container(


                    child: ListView.builder(
                        itemCount: widget.detailProviFoodItems.length,

                        // ignore: missing_return
                        itemBuilder: (BuildContext context, int index) {
                          //single product class widget returns one builded cardview
                          var FoodItemname = widget
                              .detailProviFoodItems[index]["name"];
                          var FoodItemPrice = widget
                              .detailProviFoodItems[index]["price"];
                          var FoodItemThumb = widget
                              .detailProviFoodItems[index]["itemImage"];
                          var FoodItemCountQtyOption = widget
                              .detailProviFoodItems[index]["foodItemCountableQty"];
                          var FoodItemUnCountQtyOption = widget
                              .detailProviFoodItems[index]["foodItemUncountableQty"];
                          var FoodItemDescription = widget
                              .detailProviFoodItems[index]["itemDescription"];
                          var FoodItemCount = int.parse(widget
                              .detailProviFoodItems[index]["itemQuantity"]);


                          return SingleFoodItems(foodItemName: FoodItemname,
                            foodItemPrice: FoodItemPrice,
                            foodItemThumb: FoodItemThumb,
                            foodQtyCountOption: FoodItemCountQtyOption,
                            foodQtyUnCountOption: FoodItemUnCountQtyOption,
                            foodItemDescription: FoodItemDescription,
                            singlefoodItemCount: FoodItemCount,


                          );
                        }),


                ),
              )


            ],

          ),
        )
    );
  }
}









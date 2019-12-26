
import 'package:desistore/pages/cart.dart';
import 'package:desistore/pages/orderDetailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desistore/constants.dart';
import 'package:desistore/models/cartModel.dart';
import 'package:provider/provider.dart';


class CartItemBottomSheet extends StatefulWidget {
  @override
  _CartItemBottomSheetState createState() => _CartItemBottomSheetState();
}

class _CartItemBottomSheetState extends State<CartItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(

        height: 500,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )),

          child: Column(
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 150,right: 0,),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Food Cart",style: kNormalText ,),
                      ),
                    ),
                  ),
               
                  Container(
                    child: IconButton(icon: Icon(Icons.keyboard_arrow_down,size: 30,), onPressed: (){
                       Navigator.pop(context);

                    }),
                  ),
               

               
                ],
              ),

              Divider(
                thickness: 1,
              ),
              
              //========================Bottom cart Title=========================
              
              //=========================cart Item ListView ====================
              
              Expanded(
                child: Container(

                  color: Colors.grey[200],
                  child: ListView.builder(

                    itemCount: cartModel.foodItemsList.length,
                      itemBuilder: (con, index){
                      return cartItemBuilder(
                        cartItemIndex: index,
                        cartItemName: cartModel.foodItemsList[index]["name"],
                        cartItemPrice: cartModel.foodItemsList[index]["price"],
                        cartItemThumb: cartModel.foodItemsList[index]["thumb"],
                      );


                  }),


                ),
              ),
              
              Divider(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text("${cartModel.totalPrice}₹",style: kheadinghalfBold.copyWith(color: Colors.white),),
                            ),

                            VerticalDivider(
                              color: Colors.white,
                            ),
                            Container(
                              child: Text("(${cartModel.foodItemsList.length})",style: kheadinghalfBold.copyWith(color: Colors.white),),
                            ),

                          ],
                        ),
                      ),

                      MaterialButton(

                        color: Colors.white,

                        child: Text("Checkout",style: TextStyle(fontSize: 15,color: Colors.redAccent),),
                        onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)
                    => OrderDetails()));

                        },
                      )


                    ],
                  ),
                ),
                height: 40,

                color: Colors.redAccent,
              )
            ],
            
            
          ),


      ),
    );



  }
}

class cartItemBuilder extends StatefulWidget {
  
  final cartItemName ;
  final cartItemThumb;
  final cartItemPrice;
  final cartItemIndex;
  cartItemBuilder({this.cartItemName,this.cartItemIndex,this.cartItemPrice,this.cartItemThumb});
  
  
  _cartItemBuilderState createState() => _cartItemBuilderState();
}

class _cartItemBuilderState extends State<cartItemBuilder> {
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Card(
      color: Colors.white,
      child: Container(
        height: 60,
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

          //===========================itemThumbConatiner=======
       Container(
        child: Row(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 45,
                height:45,
                decoration: BoxDecoration(



                  image: NetworkImage(widget.cartItemThumb) != null
                      ? new DecorationImage(image: NetworkImage(widget.cartItemThumb), fit: BoxFit.cover)
                      : null,
                  shape: BoxShape.circle,



                ),

              ),
            ),

            //==================FoodItemname===============

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.cartItemName,style: kheadinghalfBold),
                    Text("${widget.cartItemPrice}₹",style: kheadinghalfBold.copyWith(
                        color: Colors.redAccent
                    )),


                  ],
                ),
              ),
            ),




          ],
        ),
       ),

         IconButton(icon: Icon(Icons.remove_circle,color: Colors.redAccent[100],), onPressed: (){

           cartModel.removeItem(widget.cartItemIndex);
         })
         
         
          ],

        ),
      ),
    );
  }
}

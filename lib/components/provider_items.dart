import 'package:flutter/material.dart';
import 'package:desistore/components/cart_products.dart';
import 'cart_products.dart';
import 'package:provider/provider.dart';
import 'package:desistore/models/cartModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SingleFoodItems extends StatefulWidget {
  int foodItemCount = 0;

  final foodItemName;
  final foodItemThumb;
  final foodItemPrice;
  final foodItemDescription;
  final foodQtyCountOption;
  final foodQtyUnCountOption;
 final singlefoodItemCount;



  SingleFoodItems(
      {this.foodItemName, this.foodItemPrice, this.foodItemThumb, this.foodQtyCountOption, this.foodQtyUnCountOption,this.foodItemDescription,this.singlefoodItemCount});


  _SingleFoodItemsState createState() => _SingleFoodItemsState();
}

class _SingleFoodItemsState extends State<SingleFoodItems> {
  @override


  Widget build(BuildContext context) {

    final cartModel = Provider.of<CartModel>(context);

    return Card(
      elevation: 5,

      child: Container(
height: 120,

        child: Row(

          children: <Widget>[

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,

                  //child:FadeInImage.assetNetwork(placeholder:"images/IconAssets/baker.png", image: widget.foodItemThumb)

                  decoration: BoxDecoration(

                      image: DecorationImage(

                          image: NetworkImage(widget.foodItemThumb),
                          fit: BoxFit.cover
                      ),

                      borderRadius: BorderRadius.all(Radius.circular(3))
                  ),

                )

              // Image.asset(widget.foodItemThumb,,),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Container(

                        child: Text(
                          widget.foodItemName, style: TextStyle(fontSize: 20,color: Colors.black87),),
                      ),
                      SizedBox(height:4,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Text(
                            "${widget.foodItemPrice} ₹", style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500
                              ,
                              color: Colors.green),

                          ),
                        ),

                      ),

                    Row(
                      children: <Widget>[




                        Container(height: 16,width: 3,color: Colors.orangeAccent,),
                        Text('  odered : 4 ||'),
                        Text(' Avilable items : ${widget.singlefoodItemCount}')

                      ],
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(widget.foodItemDescription,style: TextStyle(
                        color: Colors.black54
                      ),),
                    )
                    ],

                  ),
                ),
              ),
            ),

            SizedBox(width: 10,),


            Visibility(
              visible: true,
              child: Container(
                child: Column(
                  children: <Widget>[

                    InkWell(child: Icon(Icons.arrow_drop_up,size: 35,color: Colors.black54,), onTap: () {
                      setState(() {
                        if(widget.foodItemCount<=widget.singlefoodItemCount-1)
                        widget.foodItemCount++;
                      });
                    },),
                    Text("${widget.foodItemCount}", style: TextStyle(fontSize: 18),),
                    InkWell(child: Icon(Icons.arrow_drop_down,size: 35,color:Colors.black54), onTap: () {
                      setState(() {
                        widget.foodItemCount--;
                      });
                    },),


                  ],


                ),
              ),
            ),


            Expanded(child: IconButton(
              icon: Icon(Icons.add_shopping_cart), onPressed: () {


                if(widget.foodItemCount!=0){
                  var itemData = {
                    "name": widget.foodItemName,
                    "price": widget.foodItemPrice.toString(),
                    "thumb": widget.foodItemThumb,

                  };


                  for(int i  = 0 ; i<=widget.foodItemCount-1;i++){
                    cartModel.setItem(itemData);
                    cartModel.addFoodItems();

                    print(cartModel.foodItemsList);
                  }


                }
                else{
                  print("please add atleast one item");
                }



            },))


          ],


        ),


      ),


    );
  }
}


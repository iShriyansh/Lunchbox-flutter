import 'package:flutter/material.dart';
import 'package:desistore/models/cartModel.dart';
import 'package:provider/provider.dart';
class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomAppBar(
           elevation: 10,
          color: Colors.red,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(

                height: 50,
                child: Center(
                  child: Text("Place Order",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              )
            ],
          ),
          
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white70
//                      border: Border.all(style: BorderStyle.solid)
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Total items ",style: TextStyle(fontSize: 20,decoration: TextDecoration.underline),),
                        ),


                           Container(
                             height: 200,

                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: cartModel.foodItemsList.length,
                                itemBuilder: (context,index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 150),
                                    child: Container(
                                      child: Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                     Text(cartModel.foodItemsList[index]["name"],style: TextStyle(fontSize: 17)),
                                          SizedBox(width: 5,),
                                          Text( ": ${cartModel.foodItemsList[index]['price']}₹",style: TextStyle(fontSize: 20)),
                                        ],
                                      ),

                                    ),
                                  );
                                }),
                          ),


     Divider(
       indent: 40,
       endIndent: 20,
       thickness: 2,
     ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,bottom: 12),
                          child: Container(
                            child: Text("total: ${cartModel.totalPrice}₹",style: TextStyle(fontSize: 20)),
                          ),
                        )

                      ],


                    ),
                  ),
                ),
              ),
          Divider(),
             Row(children: <Widget>[
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(right :50),
                   child: Container(

                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left: 8,top: 8,right: 8,bottom: 1),
                           child: Text("Delivery Address",style: TextStyle(fontSize: 16,color: Colors.black54),),
                         ),

                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ."),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(right: 20),
                 child: InkWell(child: Icon(Icons.mode_edit,color: Colors.grey,),onTap: (){

                 },),
               )

             ],),


              Divider(),
             Padding(
               padding: const EdgeInsets.only(left:8.0),
               child: Text("Payment mode",style: TextStyle(fontSize: 17,color: Colors.black54),),
             ),
              ListTile(
                leading: Radio(value: false , groupValue: false, onChanged: (value){
                  
                }),
              title: Text("Cash on delivery",style: TextStyle(fontSize: 18),),
              
              ),
                 
          Divider()
          
          
            ],
          ),

        ),



      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:desistore/pages/product_details.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {




  Future getPosts() async {
    var firestore = Firestore.instance;

    //==== querysnapshot is a array of data collection in firestore db

    QuerySnapshot foodProviderGrid = await firestore.collection("foodP")
        .getDocuments();
//    QuerySnapshot foodProviderGrid = await firestore.collection("fodo").document().collection("foodItems").getDocuments();
//
    return foodProviderGrid.documents;
  }






  Widget build(BuildContext context) {

//   this builds a grid view
//    item builder class gets a single single multiple widgets from single product class and then
//    gridView.builder builds it
    return




//      GridView.builder(
//        itemCount: productList.length,
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 2),
//        // ignore: missing_return
//        itemBuilder: (BuildContext context, int index) {

//============================getting all data ================

            FutureBuilder(
              future :getPosts(),
    builder: (context ,snapshot){
    if(snapshot.connectionState==ConnectionState.waiting){
    return Center(child: Text("Loading"));
    }
    else{
    return GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              // ignore: missing_return
              itemBuilder: (BuildContext context, int index) {


    return SingleProduct(
      //============================retriveing data for home gridView=========================

                 prodName:snapshot.data[index]['providerProfile']['name'],
                 prodAddress: snapshot.data[index]['providerProfile']['address'],
                 prodPicture: snapshot.data[index]['foodProviderThumb'],
                 proviFoodItems: snapshot.data[index]['foodItems'],



    );

    } );


    }} );




  }
}

//this class build single products card in prodcuts area


class SingleProduct extends StatelessWidget {


  Random rnd;
  int min = 5;
  int max = 9;


  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;
  final prodAddress;
  final prodRatings;
  final proviFoodItems;


  SingleProduct({
    this.prodName,
    this.prodPicture,
    this.prodOldPrice,
    this.prodPrice,
    this.prodAddress,
    this.prodRatings,
    this.proviFoodItems,
  });


  Widget build(BuildContext context) {


    rnd = new Random();
   int r = min + rnd.nextInt(max - min);
    return Card(
      child: Hero(tag: Text("hero 1"),
        child: Material(
          child: InkWell(

            //****************************User navigate to prodcut detail page ..ie . pages/productdetails *************************8
              // also passing data to product detail page by constructor

            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder:
                (context)=> ProductDetails(detailProductName: prodName,
                detailProductPicture: prodPicture,
                detailProductoldPrice: prodOldPrice,
                detailProductPrice: prodPrice,
                detailLocationProvider: prodAddress,
                detailProviFoodItems: proviFoodItems,) )),

            child: GridTile(

                child: Image.network(prodPicture, fit: BoxFit.cover,),

//        prodcut details on cardView

                footer: Container(
                 height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                 children: <Widget>[


//                      Padding(
//                        padding: const EdgeInsets.only(top: 8),
//
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                          Text(prodName, style: TextStyle(fontWeight: FontWeight.bold),),
//                           Flexible(child: Text(prodAddress, style: TextStyle(fontSize: 12,color: Colors.grey,),overflow: TextOverflow.ellipsis,)),
//
//                          ],),
//
//                      ),
                   Flexible(
                     child: Container(
                       child: Padding(
                         padding: const EdgeInsets.only(top:8),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(prodName, style: TextStyle(fontWeight: FontWeight.bold),),
                             Text(prodAddress,overflow: TextOverflow.ellipsis,style: TextStyle(
                                 fontSize: 12,color: Colors.black87
                             ),),
                           ],
                         ),
                       ),

                     ),
                   ),






                     Container(
                       padding:EdgeInsets.all(2),
                       decoration: BoxDecoration(
                         border: Border.all(width: 1,style: BorderStyle.solid,color: Colors.grey,),
                         borderRadius: BorderRadius.circular(2),


                       ),

                       child:
                       Text("5/4",style: TextStyle(color: Colors.grey,fontSize: 12),),
                     )



                 ],
                    ),
                  ),
            ),

          ),


        ),


      ),),);


  }
}


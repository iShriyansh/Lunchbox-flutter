import 'package:desistore/pages/orderDetailsPage.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'package:provider/provider.dart';
import 'models/cartModel.dart';
import 'pages/product_details.dart';
import 'components/provider_items.dart';
import 'pages/login.dart';
import 'pages/cartItemBottomSheet.dart';
import 'package:desistore/pages/cartItemBottomSheet.dart';


void main() =>
    runApp(
        MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => CartModel(0)),

              Provider(create: (context) => ProductDetails()),
              Provider(create: (context) => SingleFoodItems()),
              Provider(create: (context) => CartItemBottomSheet()),
                Provider(create: (context) => OrderDetails()),





            ],

            child: MyApp(

            )
        )
    );



class MyApp extends StatelessWidget {
  

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),


    );
  }
}


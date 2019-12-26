import 'package:flutter/material.dart';


class CartModel with ChangeNotifier {


  int _counter;
  var  foodItemsList = [];
  var _getItem ;
  int totalPrice = 0 ;


  CartModel(this._counter);

  getCounter() => _counter;
  getItem() => _getItem;

  setCounter(int counter) => _counter = counter;
  setItem(var foodItem){

    _getItem = foodItem;

  }

  int totalitems(){
    return foodItemsList.length;
  }

  void addFoodItems (){

    foodItemsList.add(getItem());

    //================================== add collection  price ==string== values=============

    totalPrice =  foodItemsList.map<int>((m) => int.parse(m["price"])).reduce((a,b )=>a+b);



    print(totalPrice);

    notifyListeners();

  }

  void UpdatecartPrice(){


    ChangeNotifier();
  }




  void removeItem(rIndex){
    int oneitemPrice = int.parse(foodItemsList[rIndex]["price"]);
    totalPrice = totalPrice - oneitemPrice;
    foodItemsList.removeAt(rIndex);

    notifyListeners();
  }













}

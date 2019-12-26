import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text("Account"),
      ),


    body: Column(
      
      children: <Widget>[
        Container(
         color: Colors.red,
              height: 170,
              width: double.infinity,
             
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
             
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(Icons.account_circle,size: 70,color: Colors.white,),
              ),

              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text("Shriyansh Raj",style: TextStyle(color: Colors.white,fontSize: 25),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 125),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("+919685962799",style: TextStyle(color: Colors.white,fontSize: 16),),
                      
                        
                        Icon(Icons.mode_edit,color: Colors.white,size: 20,),
                       
                   
                   
                    ],
                  ),
                ),
              )
             


              ],
            ),



              ),
            ),
      
      
      Expanded(
        child: Container(
          
          width: double.infinity,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: <Widget>[
                   accountDetailsCard(cardHeading: "My Orders",cardSubHeadLink: "VIEW ALL ORDERS",cardSubHeadLinkFun: (){


                   }),
                   accountDetailsCard(cardHeading: "My Addresses",cardSubHeadLink: "VIEW ALL ADDRESS",cardSubHeadLinkFun: (){


                   }),
                    accountDetailsCard(cardHeading: "Customer Care",cardSubHeadLink: "CONTACT DETAILS",cardSubHeadLinkFun: (){


                   }),

                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: Container(width: double.infinity,height: 50,color: Colors.white,child: Row(
                       children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right:10 ),
                        child: Icon(Icons.arrow_back_ios,color: Colors.grey,size: 20,),
                      ),
                      Text("Sign out",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Colors.black),)
                       ],
                     ),),
                   )
                
                  
                  
               
                ],
              )
            ),
       
       
          )
      
      
      )
      
      
      
      ],
    ),

    );
  }

  Column accountDetailsCard({String cardHeading,String cardSubHeadLink,Function cardSubHeadLinkFun}) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Card(
  elevation: 8,
  child: Container(
    height: 100,
    width: double.infinity,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 13,top: 8,bottom: 3),
        child: Text(cardHeading,style:TextStyle(fontSize:17),),
      ),
      Divider(thickness: 1,indent: 8,endIndent: 8,),
     
      Padding(
        padding: const EdgeInsets.only(left: 250,top: 15),
        child: Text(cardSubHeadLink,style: TextStyle(color: Colors.deepOrangeAccent),),
      )
   
   
    ]
    
    ,
  ),

  ),
)


],

            );
  }
}

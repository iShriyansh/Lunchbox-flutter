import 'package:desistore/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:desistore/components/horizontal_listview.dart';
import 'package:desistore/components/Products.dart';
import 'package:desistore/pages/cart.dart';
import 'login.dart';
import 'package:geolocator/geolocator.dart';
import 'profile.dart';
import 'FoodPMaps.dart';
import 'package:desistore/Map Modules/current_location.dart';




class HomePage extends StatefulWidget {





  final String userName ;


  HomePage({this.userName});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
    
  }

  final List<Widget> pages = [
    MainPage(
      key: PageStorageKey('mainPage'),
    ),
    cart(
      key: PageStorageKey('cart'),
    ),
    FoodPMaps(
      key: PageStorageKey('foodPMaps'),
    ),

   UserProfile(
      key: PageStorageKey('Page2'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
     type: BottomNavigationBarType.fixed,
     selectedItemColor: Colors.deepOrange,
     selectedIconTheme: const IconThemeData(color: Colors.deepOrange),
    
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    items:  <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.fastfood,color:_selectedIndex==0? Colors.deepOrange:Colors.black54), title: Text('Providers',style: TextStyle(fontSize: 14))),
      BottomNavigationBarItem(
          icon: Icon(Icons.map,color: _selectedIndex==1? Colors.deepOrange:Colors.black54), title: Text('Food Map',style: TextStyle(fontSize: 14))),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart,color:_selectedIndex==2? Colors.deepOrange:Colors.black54), title: Text('Cart',style: TextStyle(fontSize: 14))),

      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,color:_selectedIndex==3? Colors.deepOrange:Colors.black54), title: Text('Account',style: TextStyle(fontSize: 14))),
    ],
  );





  Widget build(BuildContext context) {

   return Scaffold(
       bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
    body: PageStorage(
    child: pages[_selectedIndex],
    bucket: bucket,
   )

   );
  }
}

class drawerListTilesNav extends StatelessWidget {
  drawerListTilesNav({this.icon, this.label, this.labeltap,this.iconColor});

  final IconData icon;
  final String label;
  final Function labeltap;
  final Color iconColor ;

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: labeltap,
      child: ListTile(

        leading: IconTheme(
          data: new IconThemeData(
              color: Colors.red).copyWith(color: iconColor)
          ,
          child: new Icon(icon),

        ),



        title: Text(label),
      ),

    );
  }
}
class MainPage extends StatefulWidget {

  const MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  Widget imagecarosol = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [

        AssetImage('images/OffersBaners/b1.jpg'),
        AssetImage('images/OffersBaners/b2.jpg'),
        AssetImage('images/OffersBaners/b3.jpg'),


      ],
      autoplay: false,
      indicatorBgPadding: 5,
      dotSize: 4,
      dotBgColor: Colors.transparent,




    ),
  );


  Widget build(BuildContext context) {
    return Scaffold(
     

appBar: AppBar(


title :Container(
  height: 50,
  width: double.infinity,
  //main Row
  child: Row(
    children: <Widget>[
// Second ROW 
  
  Image.asset("images/IconAssets/logo2.png",height: 40,),

  Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Container(
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
         Padding(
                      padding: const EdgeInsets.only(top: 4,left: 10),
                      child: Text("Lunch Box",),
                    ),

            Padding(
                      padding: const EdgeInsets.only(top: 4,left: 6),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.location_on,size: 17,),
                          Text("231B,Premnagar,madan mahal",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                        ],
                      ),
                    )        
 
 
 
     ],

    ),

    ),
  ),
  












    ],
  ),



),

actions: <Widget>[

Padding(
  padding: const EdgeInsets.only(right: 30),
  child:   IconButton(icon: Icon(Icons.search),onPressed: () async{ 
print("S");
 Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

  },),
)

],


backgroundColor: Colors.red,




),





      body: ListView(
        children: <Widget>[
          imagecarosol,

//            Padding(padding: EdgeInsets.all(8),child: Text("Categories"),),
//
//            HorizontalList(),

          Padding(padding: EdgeInsets.all(14),child: Text("Food Providers"),),

          Container(
            height: 500,
            child:Products() ,
          )


        ],
      ),
    );





  }
}

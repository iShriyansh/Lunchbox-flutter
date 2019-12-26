
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desistore/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:desistore/dataBase/retrieving_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
final GoogleSignIn googleSignIn  = new GoogleSignIn();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 SharedPreferences sharedPreferences;



 bool loading = false;
 bool isLoggedIn = false;






class _LoginPageState extends State<LoginPage> {

  void initState(){
    super.initState();
    isSignedIn();

  }


  void isSignedIn() async{

    //=================init Loading icon===========
//    setState(() {
//      loading = true;
//    });

    sharedPreferences =  await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();


  if(isLoggedIn){

    //if log in successful navigate to Homepage

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));


    //=================init Loading icon===========
    setState(() {
    loading =false;

  });
  }

  }

  Future HandleSignIn() async{

    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {

      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication  = await googleUser.authentication;


    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final FirebaseUser firebaseuser =  (await firebaseAuth.signInWithCredential(credential)).user;

     if(firebaseuser != null){
        //if user is alredy signed Up

       final QuerySnapshot result = await Firestore.instance.collection("users").where("id",isEqualTo: firebaseuser.uid).getDocuments();
       final List<DocumentSnapshot>  documents = result.documents;

       if(documents.length==0){
         //===========================Insert the user to our Collection ==================

         Firestore.instance.collection("users").
         document(firebaseuser.uid).
         setData({

           "id" : firebaseuser.uid,
           "userName" : firebaseuser.displayName,
           "profilePicture": firebaseuser.photoUrl
         });


         //==================saving data to sharedPreferences==========================

         await sharedPreferences.setString("id", firebaseuser.uid);
         await sharedPreferences.setString("userName", firebaseuser.displayName);
         await sharedPreferences.setString("photoUrl", firebaseuser.photoUrl);

       }
       //=======================user already exist in collection saving data to sharedPreference========

       await sharedPreferences.setString("id", documents[0]['id']);
       await sharedPreferences.setString("userName", documents[0]['userName']);
       await sharedPreferences.setString("photoUrl", documents[0]['photoUrl']);



    setState(() {


      loading = false;
      
      Fluttertoast.showToast(msg: "Login Successful");

     Navigator.of(context).push(new MaterialPageRoute(builder:
         (context)=> HomePage()));


    });



     } 
    //=========================if firebaseuser=null then ======================
     else{

       Fluttertoast.showToast(msg: "Login unSuccessful");


     }


  }




  Widget build(BuildContext context) {


    return Scaffold(

      body: Stack(
        children: <Widget>[
        
          Center(
            child: FlatButton(
              color: Colors.greenAccent,
                onPressed: (){
                  HandleSignIn();
                }
                , child: Text("SignIn/SignUp with Google",style: TextStyle(color: Colors.white),)),
          ),

          Center(
            child: Visibility(
              visible: loading ?? true,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),

            ),
          )

          
        ],
      ),




    );
  }


}

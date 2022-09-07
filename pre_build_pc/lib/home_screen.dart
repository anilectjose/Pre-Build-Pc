import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pre_build_pc/notification.dart';
import 'package:pre_build_pc/pc_category.dart';
import 'package:pre_build_pc/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Prebuild_pc.dart';
import 'cart.dart';
import 'cart_2.dart';
import 'cart_described.dart';
import 'complaint.dart';
import 'customize_pc.dart';
import 'login_page.dart';
import 'orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _SampleState createState() => new _SampleState();
}

class _SampleState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          backgroundColor: Prebuild_pc.themecolor,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
        ),
        body:Stack(
          children: [
            Container(
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/backgrounds/mc7.jpg"),
                  fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0,right: 70.0,top: 10.0,bottom: 10.0),
              child: Image.asset("assets/logos/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0,left: 10.0,right: 10.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: <Widget>[
                  FlatButton(
                    onPressed:(){
                      print('Profile Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Profile();
                      }));
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset("assets/icons/profile.png",
                                height: 100.0,
                                width: 100.0,),
                            ),
                            Center(
                              child: Text("Profile"),
                            )
                          ],
                        )
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      print('Cart Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Cart_desc2();
                      }));
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset("assets/icons/cart.png",
                                height: 100.0,
                                width: 100.0,),
                            ),
                            Center(
                              child: Text("Cart"),
                            )
                          ],
                        )
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      print('Customize Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Pc_Category();
                      }));
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset("assets/icons/customize.png",
                                height: 100.0,
                                width: 100.0,),
                            ),
                            Center(
                              child: Text("Customize PC"),
                            )
                          ],
                        )
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      print('Notification Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Notifications();
                      }));
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset("assets/icons/notification.png",
                                height: 100.0,
                                width: 100.0,),
                            ),
                            Center(
                              child: Text("Notifications"),
                            )
                          ],
                        )
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      print('Complaint edit Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Complaint_post();
                      }));
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset("assets/icons/writecomplaint.png",
                                height: 100.0,
                                width: 100.0,),
                            ),
                            Center(
                              child: Text("Complaint"),
                            )
                          ],
                        )
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      print('Recent orders Button Pressed');
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Recent_Orderds();
                      }));
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset("assets/icons/recent.png",
                                height: 100.0,
                                width: 100.0,),
                            ),
                            Center(
                              child: Text("Recent orders"),
                            )
                          ],
                        )
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      print('Log out Button Pressed');
                      final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                      sharedPreferences.remove('role');
                      sharedPreferences.remove('email');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                    },
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset("assets/icons/logout.png",
                                height: 100.0,
                                width: 100.0,),
                            ),
                            Center(
                              child: Text("Logout"),
                            )
                          ],
                        )
                    ),
                  ),
                ],

              ),),



          ],
        ) ,
      ),
    );
  }
}

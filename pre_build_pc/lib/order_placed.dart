import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Prebuild_pc.dart';
import 'cart_2.dart';
import 'customize_pc.dart';

class added_Order extends StatefulWidget {
  String id;
  added_Order({Key key, @required this.id}) : super(key: key);

  @override
  _added_OrderState createState() => _added_OrderState(id: id);
}

class _added_OrderState extends State<added_Order> {
  String id,Roleid;
  _added_OrderState({this.id});

  Future getData(String id) async {
    var url = Prebuild_pc.BaseURL+'added_item.php';
    var credit = {"prodid": id};
    var response = await http.post(url, body: credit);
    return json.decode(response.body);
  }
  Future updateCart(String id,String Roleid) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var Roleid = sharedPreferences.getString('roleId');
    var url = Prebuild_pc.BaseURL + "add_product.php";
    var data = {"prodid": id,"roleid": Roleid};
    var res = await http.post(url, body: data);
    print("Success");
    print("Product id:"+id);
  }

  @override
  void initState(){
    super.initState();
    updateCart(id,Roleid);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Added'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Prebuild_pc.themecolor,
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgrounds/mc7.jpg"),
                    fit: BoxFit.fill)),
          ),
          FutureBuilder(
            future: getData(id),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "Successfully added to your cart",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(list[index]['product_name'],
                            style: TextStyle(fontSize: 30),),
                          SizedBox(height: 20),
                          Text(list[index]['product_model'],
                            style: TextStyle(fontSize: 25),),
                          SizedBox(height: 30),
                          Text("Enjoy shopping with us.."),
                          SizedBox(height: 20),
                          TextButton(
                              child: Text('Order NOW', style: TextStyle(fontSize: 15),),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return Cart_desc2();
                                }));
                              }),
                          TextButton(
                              child: Text('Continue adding to cart'),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return Customize_Pc();
                                }));
                              })
                        ],
                      ),
                    );
                  })
                  : Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ]),
      ),
    );
  }
}

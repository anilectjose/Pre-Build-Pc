import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Prebuild_pc.dart';
import 'added_cart.dart';
import 'customize_pc.dart';

class ProductDetail extends StatefulWidget {
  String id;
  ProductDetail({Key key, @required this.id}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState(id: id);
}

class _ProductDetailState extends State<ProductDetail> {
  String id,Roleid;
  String code="A2";
  _ProductDetailState({this.id});

  Future getData(String Roleid, String id) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var Roleid = sharedPreferences.getString('roleId');
   // print(Roleid);
    var url = Prebuild_pc.BaseURL + "product_view.php";
    var credit = {"roleid": Roleid,"prodid": id};
    var response = await http.post(url, body: credit);
    return json.decode(response.body);
  }

  Future updateCart(String id,String Roleid,String code) async{
  /*  final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var Roleid = sharedPreferences.getString('roleId');
    var url = Prebuild_pc.BaseURL + "add_device.php";
    var data = {"device": id,"code": code,"roleid": Roleid};
    var res = await http.post(url, body: data);*/
    print("Success");
    print(id);
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Select product'),
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
            future: getData(Roleid,id),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, int index) => Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(0.0)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(list[index]['product_id'],
                                          style: TextStyle(
                                              fontSize: 0)),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width,
                                            child: Text(
                                              list[index]['product_name'],
                                              style: TextStyle(
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Container(
                                            width: width,
                                            child: Text(list[index]['product_model'],
                                              style: TextStyle(
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Container(
                                            width: width,
                                            child: Text("₹"+list[index]['product_price'],
                                              style: TextStyle(
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 5),
                                    child: FlatButton(
                                      onPressed: () {
                                        String productId=list[index]['product_id'];
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return added_Cart(id:productId,typeId:id);
                                                }));
                                      },
                                      color: Prebuild_pc.themecolor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Add",
                                      ),
                                      textColor: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
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

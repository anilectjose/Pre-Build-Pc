import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pre_build_pc/product_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Prebuild_pc.dart';

class Customize_Pc extends StatefulWidget {
  String id;
  Customize_Pc({Key key, @required this.id}) : super(key: key);

  @override
  _Customize_PcState createState() => _Customize_PcState(id: id);
}

class _Customize_PcState extends State<Customize_Pc> {
  String id,Roleid;
  String code="A1";
  _Customize_PcState({this.id});


  Future getData() async {
    var url = Prebuild_pc.BaseURL+'type_view.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  Future getAllName(String id,String Roleid,String code) async{
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var Roleid = sharedPreferences.getString('roleId');
    var url = Prebuild_pc.BaseURL + "add_device.php";
    var data = {"device": id,"code": code,"roleid": Roleid};
    var res = await http.post(url, body: data);
    print("Success");
    print(id);
  }

  @override
  void initState(){
    super.initState();
    getAllName(id,Roleid,code);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Select specifications'),
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
            future: getData(),
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
                                      Text(list[index]['category_id'],
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
                                              list[index]['category_type'],
                                              style: TextStyle(
                                                  fontSize: 20),
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
                                        String id=list[index]['category_id'];
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return ProductDetail(id:id);
                                                }));
                                      },
                                      color: Prebuild_pc.themecolor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "View",
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

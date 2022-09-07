import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Prebuild_pc.dart';
import 'customize_pc.dart';

class Cart_desc2 extends StatefulWidget {

  @override
  _Cart_desc2State createState() => _Cart_desc2State();
}

class _Cart_desc2State extends State<Cart_desc2> {
  var compCon = new TextEditingController();
  String RoleId, comp;

  SaveData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var RoleId = sharedPreferences.getString('roleId');
    print(RoleId);
    var url = Prebuild_pc.BaseURL + "make_order2.php";
    var credit = {"roleid": RoleId,"custom":comp};
    var res = await http.post(url, body: credit);
  }

  Future getData() async {
    var url = Prebuild_pc.BaseURL + 'cart_described.php';
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var Roleid = sharedPreferences.getString('roleId');
    print("Role id:"+Roleid);
    var credit = {"roleid": Roleid};
    var response = await http.post(url, body: credit);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Your Wishlist'),
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
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        //IF YOU NEED A LIST VIEW OF CARTS, IT IS ALSO CREATED IN THE NAME OF CART.DART AND THIS PAGE WILL BE CHANGED TO CART_DESCRIBED
                        ListTile(
                          title: Text('Device:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(list[index]['device'],
                              style: TextStyle(
                                  fontFamily: 'Poppins', letterSpacing: 1)),
                        ),
                        ListTile(
                          title: Text('Company:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(list[index]['company'],
                              style: TextStyle(
                                  fontFamily: 'Poppins', letterSpacing: 1)),
                        ),
                        ListTile(
                          title: Text('RAM:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(list[index]['Ram'],
                              style: TextStyle(
                                  fontFamily: 'Poppins', letterSpacing: 1)),
                        ),
                        ListTile(
                          title: Text('Memory:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(list[index]['memory'],
                              style: TextStyle(
                                  fontFamily: 'Poppins', letterSpacing: 1)),
                        ),
                        ListTile(
                          title: Text('Processor:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(list[index]['processor'],
                              style: TextStyle(
                                  fontFamily: 'Poppins', letterSpacing: 1)),
                        ),
                        ListTile(
                          title: Text('CD Drive:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(list[index]['cd_writer'],
                              style: TextStyle(
                                  fontFamily: 'Poppins', letterSpacing: 1)),
                        ),
                        ListTile(
                          title: Text('Price:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text("₹ "+list[index]['price'],
                              style: TextStyle(
                                  fontFamily: 'Poppins', letterSpacing: 1)),
                        ),
                        ListTile(
                          title: Text('Customize more:',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              textCapitalization:
                              TextCapitalization.sentences,
                              controller: compCon,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                labelText: 'Add details',
                                hintText: 'Enter details if you need',
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0)),
                              ),
                              maxLines: 10,
                              maxLength: 500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            comp = compCon.text;
          });
          SaveData();
          Fluttertoast.showToast(
              msg: "Order placed..", textColor: Colors.black);
        },
        backgroundColor: Prebuild_pc.themecolor,
        child: Icon(Icons.done),
      ),
    );
  }
}

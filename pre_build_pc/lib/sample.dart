import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Prebuild_pc.dart';

class Customize_Pc extends StatefulWidget {
  String id;
  Customize_Pc({Key key, @required this.id}) : super(key: key);

  @override
  _Customize_PcState createState() => _Customize_PcState(id: id);
}

class _Customize_PcState extends State<Customize_Pc> {
  String id;
  _Customize_PcState({this.id});


  String selectedName,selectedRAM,selectedMemory,selectedCore;
  List data = List();
  List data2 = List();

  Future getAllName() async{
    var response = await http.get(Prebuild_pc.BaseURL + "customize_pc.php", headers:{"Accept":"application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      data = jsonData;
    });
    print(jsonData);
    print("Success");
    print(id);
  }

/*  Future getPrice() async{
    var response = await http.get(Prebuild_pc.BaseURL + "pricing.php", headers:{"Accept":"application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      data2 = jsonData;
    });
    print(jsonData);
    print("Price accrued");
    print(id);
  }*/
  SaveData(String selectedName, String selectedRAM, String selectedMemory,selectedCore) async {

    var url = Prebuild_pc.BaseURL + "check_price.php";

    var data = {
      "company": selectedName,
      "ram": selectedRAM,
      "memory": selectedMemory,
      "core": selectedCore,
    };
    var res = await http.post(url, body: data);
  }


  @override
  void initState(){
    super.initState();
    getAllName();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Customize PC',),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Prebuild_pc.themecolor,
        ),
        body:Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/backgrounds/mc7.jpg"),
                      fit: BoxFit.fill)),
            ),
            Column(
              children: [
                /*Padding(padding: const EdgeInsets.all(5),
                child: Text("Customize",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),),),*/
                SizedBox(height: 20),
                Text("Select any company:", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold ),textAlign: TextAlign.left),
                Center(
                  child: DropdownButton(
                    value: selectedName,
                    hint: Text("System companies"),
                    items: data.map((list){
                      return DropdownMenuItem(child: Text(list['user_name']),
                          value: list['user_name']);
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        selectedName=value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text("Select  RAM:", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold ),textAlign: TextAlign.left),
                Center(
                  child: DropdownButton(
                    value: selectedRAM,
                    hint: Text("RAM details"),
                    items: data.map((list){
                      return DropdownMenuItem(child: Text(list['mobile']),
                          value: list['mobile']);
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        selectedRAM=value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text("Select internal storage details:", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold ),textAlign: TextAlign.left),
                Center(
                  child: DropdownButton(
                    value: selectedMemory,
                    hint: Text("Select HDD/SDD"),
                    items: data.map((list){
                      return DropdownMenuItem(child: Text(list['role_id']),
                          value: list['role_id']);
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        selectedMemory=value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text("Select Processor details:", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold ),textAlign: TextAlign.left),
                Center(
                  child: DropdownButton(
                    value: selectedCore,
                    hint: Text("Select Intel/AMD"),
                    items: data.map((list){
                      return DropdownMenuItem(child: Text(list['role_id']),
                          value: list['role_id']);
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        selectedCore=value;
                      });
                    },
                  ),
                ),
/*                FlatButton(
                  onPressed: () {
                    print('View medicines details');
                    setState(() {
                      Totalprice=value;
                    });
                  },
                  color: Prebuild_pc.themecolor,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        20),
                  ),
                  child: Text(
                    "Allort",
                  ),
                  textColor: Colors.white,
                ),*/
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            SaveData(selectedName, selectedRAM, selectedMemory,selectedCore);
            final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
            sharedPreferences.setString('sname', selectedName);
            sharedPreferences.setString('sram', selectedRAM);
            sharedPreferences.setString('smemory', selectedMemory);
            sharedPreferences.setString('score', selectedCore);
          },
          backgroundColor: Prebuild_pc.themecolor,
          child: Icon(Icons.done),
        ),
      ),
    );
  }
}

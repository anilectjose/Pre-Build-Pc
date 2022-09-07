import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pre_build_pc/customize_pc.dart';

import 'Prebuild_pc.dart';

class Pc_Category extends StatefulWidget {
  @override
  _Pc_CategoryState createState() => _Pc_CategoryState();
}

class _Pc_CategoryState extends State<Pc_Category> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Customize PC'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Prebuild_pc.themecolor,
        ),
        body: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/backgrounds/mc7.jpg"),
                      fit: BoxFit.fill)),
            ),
            Column(
              children: [
                SizedBox(height: 70),
                InkWell(
                  onTap: (){
                    print('Desktop Pressed');
                    String id="Desktop";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Customize_Pc(id:id);
                          Navigator.pop(context);
                        }));
                  },
                  child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 30,
                              color: Colors.black)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 130,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Text("Desktop",style: Theme.of(context).textTheme.button.apply(color: Colors.white),
                              textAlign: TextAlign.center,),
                            decoration: BoxDecoration(
                              color: Color(0xFFFF5733),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(55),
                                topLeft: Radius.circular(55),
                                bottomRight: Radius.circular(200)
                              )
                            ),
                          ),
                          Icon(Icons.monitor,size: 30,),
                        ],
                      )),
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: (){
                    print('Laptop Pressed');
                    String id="Laptop";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Customize_Pc(id:id);
                          Navigator.pop(context);
                        }));
                  },
                  child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 30,
                              color: Colors.black)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 130,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Text("Laptop",style: Theme.of(context).textTheme.button.apply(color: Colors.white),
                              textAlign: TextAlign.center,),
                            decoration: BoxDecoration(
                                color: Color(0xFFFF5733),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(55),
                                    topLeft: Radius.circular(55),
                                    bottomRight: Radius.circular(200)
                                )
                            ),
                          ),
                          Icon(Icons.laptop,size: 30,),
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

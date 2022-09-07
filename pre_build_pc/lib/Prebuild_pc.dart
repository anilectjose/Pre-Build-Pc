import 'package:flutter/cupertino.dart';

class Prebuild_pc {
  static const String name = "Pre-build Computer";
  static const String BaseURL = "http://192.168.43.195/pre_build_pc/api/";
  static const String Desc = "Choose the one,\n you prefer to want.";
  String imageAssetPath;
  String title;
  String desc;

  static const Color themecolor= Color(0xFFB96C00 );
  static Image background_image= Image.asset("assets/backgrounds/mc7.jpg");


  Prebuild_pc({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
}


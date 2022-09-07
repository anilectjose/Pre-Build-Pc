import 'package:flutter/material.dart';
import 'package:pre_build_pc/customize_pc.dart';
import 'package:pre_build_pc/home_screen.dart';
import 'package:pre_build_pc/login_page.dart';
import 'package:pre_build_pc/pc_category.dart';
import './splash_screen.dart';


void main() => runApp(new MaterialApp(
  theme:
  ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));
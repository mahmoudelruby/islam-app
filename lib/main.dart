 import 'package:flutter/material.dart';
import 'package:islamapp/home/HomeScreen.dart';
import 'package:islamapp/home/widgets/HadeathDetailsScreen.dart';
import 'package:islamapp/home/widgets/suraDetailsScreen.dart';

void main (){
  runApp(MyApplication());
 }
 class MyThemeData {
  static var PrimaryColor = Color.fromARGB(255, 183, 147, 95);
  static var AccentColor = Color.fromARGB(255, 36, 36, 36);

 }
 class MyApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
 theme: ThemeData( primaryColor: MyThemeData.PrimaryColor
 , accentColor: MyThemeData.AccentColor
 )
,routes: {

  HomeScreen.ROUTE_NAME:(context)=>HomeScreen(),
   SuraDetailsScreen.ROUTE_NAME: (context)=>SuraDetailsScreen(),
      HadethDetailsScreen.ROUTE_NAME:(context)=>HadethDetailsScreen()
},
initialRoute: HomeScreen.ROUTE_NAME,


    );

  }

 }
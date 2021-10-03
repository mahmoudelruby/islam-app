import 'package:flutter/material.dart';
import 'package:islamapp/home/HadeathFragment.dart';

import '../../main.dart';

class HadethDetailsScreen extends StatelessWidget{


  static final ROUTE_NAME = 'haeath_details';

  @override
  Widget build(BuildContext context) {
    var hadethargs = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return  SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
        child: Scaffold(

          appBar: AppBar(
            title: Text(
              hadethargs .title,
              style: TextStyle(color: MyThemeData.AccentColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(200, 255, 255, 255), borderRadius: BorderRadius.circular(8)),
              child:Text(hadethargs.content)
          ),
        ),
      ),
    ); ;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/services/asset_bundle.dart';
import 'package:islamapp/home/widgets/ayaitem.dart';

import '../../main.dart';

class SuraDetailsScreen extends StatefulWidget {
  static final ROUTE_NAME = 'sura_details';

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;

    readSuraContent('assets/content/${args.filePosition}.txt');
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(200, 255, 255, 255), borderRadius: BorderRadius.circular(8)),
              child: ayatlist.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return AyaWidget(ayatlist[index], index + 1);
                      },
                      itemCount: ayatlist.length,
                    )),
          appBar: AppBar(
            title: Text(
              args.SuraName,
              style: TextStyle(color: MyThemeData.AccentColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }

  List<String> ayatlist = [];

  void readSuraContent(String fileName) async {
    String fileContent = await rootBundle.loadString(fileName);
    fileContent.split('\n');
    List<String> lines = fileContent.split('\n');
    setState(() {
      ayatlist = lines;
    });
  }
}

class SuraDetailsArgs {
  int filePosition;
  String SuraName;

  SuraDetailsArgs(this.filePosition, this.SuraName);
}

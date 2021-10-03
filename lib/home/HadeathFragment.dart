import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamapp/home/widgets/HadethTitleWidget.dart';

class HadeathFragment extends StatefulWidget {
  @override
  _HadeathFragmentState createState() => _HadeathFragmentState();
}

class _HadeathFragmentState extends State<HadeathFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    //  loadHadethFile();
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Center(
                child: Image(
                    image: AssetImage('assets/images/hadeath_icon.png')))),
        SizedBox(height: 10),
        Expanded(
//flex: 1,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child:
                  Center(child: Text('hadeth', style: TextStyle(fontSize: 25))),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor)),
            ),
          ],
        )),
        Expanded(
            flex: 2,
            child: hadethList.length == 0
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return HadethTitleWidget(hadethList[index]);
                    },
                    itemCount: hadethList.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: Theme.of(context).primaryColor,
                      );
                    },
                  ))
      ],
    );
  }

  List<Hadeth> hadethList = [];


  void loadHadethFile() async {
    List<Hadeth> list = [];
    String filecontent =
        await rootBundle.loadString('assets/content/ahadeth.txt');
    List<String> allHadeathConten = filecontent.split('#\r\n');
    print(allHadeathConten.length);
    for (int i = 0; i < allHadeathConten.length; i++) {
      String HadeathContent = allHadeathConten[i];
      List<String> hadethlines = HadeathContent.split('\r\n');
      var title = hadethlines[0];
      var content = '';
      for (int j = 1; j < hadethlines.length; j++) {
        content = hadethlines[j];
      }
      Hadeth hadeth = Hadeth(title, content);
      list.add(hadeth);
    }

    setState(() {
      hadethList = list;
    });
  }
}

class Hadeth {
  String title;
  String content;
  Hadeth (this.title, this.content);
}

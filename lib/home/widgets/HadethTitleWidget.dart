import 'package:flutter/material.dart';
import 'package:islamapp/home/HadeathFragment.dart';
import 'package:islamapp/home/widgets/HadeathDetailsScreen.dart';
import 'package:islamapp/home/widgets/suraDetailsScreen.dart';

class HadethTitleWidget extends StatelessWidget {

  Hadeth hadeth;
  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => {
        Navigator.of( context ).pushNamed(HadethDetailsScreen.ROUTE_NAME,
        arguments: hadeth)
      },
      child: Center(
        child: Text(
          hadeth.title ,

          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }


}

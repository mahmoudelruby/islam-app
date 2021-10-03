import 'package:flutter/material.dart';
import 'package:islamapp/home/widgets/suraDetailsScreen.dart';

class SuraNameWidget extends StatelessWidget {
  String nameOfSura;
  int position;
  SuraNameWidget(this.nameOfSura, this.position);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => {OnItemClick(context)},
      child: Center(
        child: Text(
          nameOfSura,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  OnItemClick(BuildContext context) {
    Navigator.of(context).pushNamed(SuraDetailsScreen.ROUTE_NAME,
    arguments: SuraDetailsArgs(position, nameOfSura));
  }
}

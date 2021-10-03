import 'package:flutter/material.dart';
import 'package:islamapp/home/HadeathFragment.dart';
import 'package:islamapp/home/QuranFragment.dart';
import 'package:islamapp/home/RadioFragment.dart';
import 'package:islamapp/home/TasbehFragment.dart';
import 'package:islamapp/main.dart';

class HomeScreen extends StatefulWidget {
  static final ROUTE_NAME = 'home';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyThemeData.PrimaryColor),
            child: BottomNavigationBar(
              onTap: onButtonClick,
              showSelectedLabels: true,
              selectedItemColor: MyThemeData.AccentColor,
              unselectedItemColor: Colors.white,
              backgroundColor: MyThemeData.PrimaryColor,
              currentIndex: selectedindex,
              selectedIconTheme:
                  IconThemeData(size: 40, color: MyThemeData.AccentColor),
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/quran.png')),
                    label: 'quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                    label: 'sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                        'assets/images/quran-quran-svgrepo-com.png')),
                    label: 'hadeath'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/radio.png')),
                    label: 'radio')
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              'islami',
              style: TextStyle(color: MyThemeData.AccentColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: getMainView(),
        ),
      ),
    );
  }

         getMainView(){
    if (selectedindex == 0) {
      return QuranFragment();
    } else if (selectedindex == 1) {
      return TasbehFragment();
    } else if (selectedindex == 2) {
      return HadeathFragment();
    } else if (selectedindex == 3) {
      return RadioFragment();
    }
  }

  void onButtonClick(int positon) {
    setState(() {
      selectedindex = positon;
    });
  }
}

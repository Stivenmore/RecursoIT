import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectmac/AssetsImage.dart';
import 'package:proyectmac/Home.dart';
import 'package:proyectmac/NotificationIt.dart';
import 'package:proyectmac/Profile.dart';
import 'package:proyectmac/Setting.dart';
import 'package:proyectmac/Wallet.dart';

class Desing extends StatefulWidget {
  Desing({Key? key}) : super(key: key);

  @override
  _DesingState createState() => _DesingState();
}

class _DesingState extends State<Desing> {
  Color BaseColor = const Color(0xFFF2F2F2);
  List<Widget> screens = [
    Home(),
    Profile(),
    Setting(),
    NotificationIT(),
    Wallet()
  ];

  List<Map<String, dynamic>> bottonnav = [
    {
      "icon": Assets.menuHome,
      "enable": "${Assets.menuHome}Enable.png",
      "disable": "${Assets.menuHome}Disable.png"
    },
    {
      "icon": Assets.menuMarketplace,
      "enable": "${Assets.menuMarketplace}Enable.png",
      "disable": "${Assets.menuMarketplace}Disable.png"
    },
    {
      "icon": Assets.menuWallet,
      "enable": "${Assets.menuWallet}Enable.png",
      "disable": "${Assets.menuWallet}Disable.png"
    },
    {
      "icon": Assets.menuNotification,
      "enable": "${Assets.menuNotification}Enable.png",
      "disable": "${Assets.menuNotification}Disable.png"
    },
    {
      "icon": Assets.menuProfile,
      "enable": "${Assets.menuProfile}Enable.png",
      "disable": "${Assets.menuProfile}Disable.png"
    },
  ];

  int _selectIndex = 0;

  void _onTap(int index){
    setState(() {
      _selectIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: screens.elementAt(_selectIndex),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: size.width,
        height: 80,
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: size.width*.05),
            physics: NeverScrollableScrollPhysics(),
            itemCount: bottonnav.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => _onTap(index),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClayContainer(
                    borderRadius: 20,
                    color: BaseColor,
                    height: 80,
                    depth: 12,
                    spread: 4,
                    child: ClayContainer(
                      emboss: _selectIndex == index,
                      borderRadius: 50,
                      color: BaseColor,
                      height: 50,
                      width: 50,
                      depth: 12,
                      spread: 4,
                      child: Image.asset( _selectIndex == index
                          ? bottonnav[index]['enable']
                          : bottonnav[index]['disable'],
                    ),
                  ),
                ),
              ));
            })),
    );
  }
}

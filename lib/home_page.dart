import 'package:flutter/material.dart';
import 'package:googletasks/bottom_sheet_menu.dart';
import 'package:googletasks/res.dart';

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: backgroundColor,
          title: Padding(
            padding: const EdgeInsets.only(
              left: largePadding,
            ),
            child: Text(
              'My Tasks',
              style: TextStyle(
                fontSize: largeTextSize,
                color: textColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
//          notchMargin: 3,
          shape: CircularNotchedRectangle(),
          color: bottomAppBarColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: buttonColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bctx) => MenuBottomSheet(),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: buttonColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: bigIconSize,
          ),
          backgroundColor: bottomAppBarColor.withOpacity(0.7),
        ),
      ),
    );
  }
}

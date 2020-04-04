import 'package:flutter/material.dart';
import 'package:googletasks/bottom_sheet_create_task.dart';
import 'package:googletasks/bottom_sheet_menu.dart';
import 'package:googletasks/bottom_sheet_more_options.dart';
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
        backgroundColor: blackColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: blackColor,
          title: Padding(
            padding: const EdgeInsets.only(
              left: normalSpace,
            ),
            child: Text(
              'My Tasks',
              style: TextStyle(
                fontSize: largeTextSize,
                color: lightGreyColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
//          notchMargin: 3,
          shape: CircularNotchedRectangle(),
          color: greyColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  size: smallButtonSize,
                  color: lightGreyColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bctx) => MenuBottomSheet(),
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: smallButtonSize,
                  color: lightGreyColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bctx) => MoreOptionsBottomSheet(),
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext bctx) => CreateTaskBottomSheet(),
              backgroundColor: Colors.transparent,
            );
          },
          child: Icon(
            Icons.add,
            size: normalButtonSize,
          ),
          backgroundColor: greyColor.withOpacity(0.7),
        ),
      ),
    );
  }
}

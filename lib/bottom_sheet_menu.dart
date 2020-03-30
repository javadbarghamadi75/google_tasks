import 'package:flutter/material.dart';
import 'package:googletasks/res.dart';

class MenuBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.add,
              color: textColor,
            ),
            title: Text(
              'Creat New List',
              style: TextStyle(
                color: textColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
          Divider(
            height: 1,
            color: buttonColor,
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              color: textColor,
            ),
            title: Text(
              'Help and Feedback',
              style: TextStyle(
                color: textColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
          Divider(
            height: 1,
            color: buttonColor,
          ),
          ListTile(
//            leading: Icon(
//              Icons.add,
//              color: textColor,
//            ),
            title: Text(
              'Open-Source Licences',
              style: TextStyle(
                color: textColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
          Divider(
            height: 1,
            color: buttonColor,
          ),
          ListTile(
//            leading: Icon(
//              Icons.add,
//              color: textColor,
//            ),
            title: Container(
              alignment: Alignment.center,
              child: Text(
                'Privacy Policy   |   Terms of Service',
                style: TextStyle(
                  color: textColor,
                  fontSize: verySmallTextSize,
                  fontFamily: 'CenturyGothic',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

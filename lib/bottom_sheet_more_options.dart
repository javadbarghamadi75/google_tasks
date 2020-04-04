import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googletasks/res.dart';

class MoreOptionsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(normalSpace),
          topLeft: Radius.circular(normalSpace),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
//            leading: Icon(
//              Icons.add,
//              size: smallButtonSize,
//              color: lightGreyColor,
//            ),
            title: Text(
              'Sort By',
              style: TextStyle(
                fontSize: smallTextSize,
                color: lightGreyColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
            subtitle: Text(
              'My Order',
              style: TextStyle(
                fontSize: verySmallTextSize,
                color: veryLightGreyColor.withOpacity(0.5),
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
          Divider(
            height: 1,
            color: lightGreyColor,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
//            leading: Icon(
//              Icons.add,
//              size: smallButtonSize,
//              color: lightGreyColor,
//            ),
                title: Text(
                  'Rename List',
                  style: TextStyle(
                    fontSize: smallTextSize,
                    color: lightGreyColor,
                    fontFamily: 'CenturyGothic',
                  ),
                ),
//                subtitle: Text(
//                  'My Order',
//                  style: TextStyle(
//                    fontSize: verySmallTextSize,
//                    color: veryLightGreyColor.withOpacity(0.5),
//                    fontFamily: 'CenturyGothic',
//                  ),
//                ),
              ),
              ListTile(
//            leading: Icon(
//              Icons.add,
//              size: smallButtonSize,
//              color: lightGreyColor,
//            ),
                title: Text(
                  'Delete List',
                  style: TextStyle(
                    fontSize: smallTextSize,
                    color: lightGreyColor.withOpacity(0.5),
                    fontFamily: 'CenturyGothic',
                  ),
                ),
                subtitle: Text(
                  "Default List can't Be Deleted",
                  style: TextStyle(
                    fontSize: verySmallTextSize,
                    color: veryLightGreyColor.withOpacity(0.5),
                    fontFamily: 'CenturyGothic',
                  ),
                ),
              ),
              ListTile(
//            leading: Icon(
//              Icons.add,
//              size: smallButtonSize,
//              color: lightGreyColor,
//            ),
                title: Text(
                  'Delete All Completed Tasks',
                  style: TextStyle(
                    fontSize: smallTextSize,
                    color: lightGreyColor.withOpacity(0.5),
                    fontFamily: 'CenturyGothic',
                  ),
                ),
//                subtitle: Text(
//                  "Default List can't Be Deleted",
//                  style: TextStyle(
//                    fontSize: verySmallTextSize,
//                    color: veryLightGreyColor.withOpacity(0.5),
//                    fontFamily: 'CenturyGothic',
//                  ),
//                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: lightGreyColor,
          ),
          ListTile(
//            leading: Icon(
//              Icons.add,
//              color: textColor,
//            ),
            title: Text(
              'Copy Reminders to Tasks',
              style: TextStyle(
                fontSize: smallTextSize,
                color: lightGreyColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
          Divider(
            height: 1,
            color: lightGreyColor,
          ),
          ListTile(
//            leading: Icon(
//              Icons.add,
//              size: smallButtonSize,
//              color: lightGreyColor,
//            ),
            title: Text(
              'Theme',
              style: TextStyle(
                fontSize: smallTextSize,
                color: lightGreyColor,
                fontFamily: 'CenturyGothic',
              ),
            ),
            subtitle: Text(
              'Dark',
              style: TextStyle(
                fontSize: verySmallTextSize,
                color: veryLightGreyColor.withOpacity(0.5),
                fontFamily: 'CenturyGothic',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

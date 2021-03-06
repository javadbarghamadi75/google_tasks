import 'package:flutter/material.dart';
import 'package:googletasks/database/entity/task_list_entity.dart';
import 'package:googletasks/res.dart';

class MenuBottomSheet extends StatelessWidget {
  final List<TasksListEntity> tasksLists;

  const MenuBottomSheet({Key key, this.tasksLists}) : super(key: key);

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
          _getTasksLists(),
          InkWell(
            child: ListTile(
              leading: Icon(
                Icons.add,
                size: smallButtonSize,
                color: lightGreyColor,
              ),
              title: Text(
                'Creat New List',
                style: TextStyle(
                  fontSize: smallTextSize,
                  color: lightGreyColor,
                  fontFamily: 'CenturyGothic',
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/createListPage');
            },
          ),
          Divider(
            height: 1,
            color: lightGreyColor,
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              size: smallButtonSize,
              color: lightGreyColor,
            ),
            title: Text(
              'Help and Feedback',
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
//              color: textColor,
//            ),
            title: Text(
              'Open-Source Licences',
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
//              color: textColor,
//            ),
            title: Container(
              alignment: Alignment.center,
              child: Text(
                'Privacy Policy   |   Terms of Service',
                style: TextStyle(
                  color: lightGreyColor,
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

  Widget _getTasksLists() {
    return ListView.builder(
      itemBuilder: (context, index) {

      },
    );
  }
}

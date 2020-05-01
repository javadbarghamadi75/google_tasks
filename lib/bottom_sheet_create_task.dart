//import 'package:flutter/material.dart';
//import 'package:flutter_rounded_date_picker/rounded_picker.dart';
//import 'package:googletasks/res.dart';
//import 'package:intl/intl.dart';
//
//class CreateTaskDialog extends StatefulWidget {
//  @override
//  _CreateTaskDialogState createState() => _CreateTaskDialogState();
//}
//
//class _CreateTaskDialogState extends State<CreateTaskDialog> {
//  bool _detailsVisible = false;
//  DateTime _selectedDate;
//  TimeOfDay _selectedTime = TimeOfDay.now();
//
//  _selectDate(BuildContext context) async {
//    DateTime newSelectedDate = await showRoundedDatePicker(
//        theme: ThemeData.dark(),
//        context: context,
//        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
//        firstDate: DateTime(2000),
//        lastDate: DateTime(2040),
//        onTapDay: (newSelectedDate, available) {
//          _selectedDate = newSelectedDate;
//          return available;
//        },
//        textActionButton: "Set Time ${_selectedTime.format(context)}",
//        onTapActionButton: () {
//          Navigator.pop(context);
//          _selectTime(context);
//        });
//
//    if (newSelectedDate != null) {
//      setState(() {
//        _selectedDate = newSelectedDate;
//      });
//    }
//  }
//
//  _selectTime(BuildContext context) async {
//    TimeOfDay newSelectedTime = await showRoundedTimePicker(
//      theme: ThemeData.dark(),
//      context: context,
//      initialTime: TimeOfDay.now(),
//    );
//
//    if (newSelectedTime != null) {
//      setState(() {
//        _selectedTime = newSelectedTime;
//      });
//    }
//    _selectDate(context);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      decoration: BoxDecoration(
//          color: greyColor,
//          borderRadius: BorderRadius.all(Radius.circular(normalSpace))),
//      padding: EdgeInsets.all(normalSpace),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          TextField(
//            style: TextStyle(fontSize: normalTextSize, color: lightGreyColor),
//            decoration: InputDecoration(
//              hintText: "New task",
//              border: InputBorder.none,
//              hintStyle: TextStyle(
//                fontSize: normalTextSize,
//                color: lightGreyColor.withAlpha(50),
//              ),
//            ),
//          ),
//          _detailsVisible
//              ? TextField(
//            cursorColor: lightBlueColor,
//            style: TextStyle(
//                fontSize: verySmallTextSize, color: lightGreyColor),
//            decoration: InputDecoration(
//              hintText: "Add details",
//              border: InputBorder.none,
//              hintStyle: TextStyle(
//                fontSize: verySmallTextSize,
//                color: lightGreyColor.withAlpha(50),
//              ),
//            ),
//          )
//              : Container(),
//          _selectedDate != null
//              ? InputChip(
//            backgroundColor: blackColor,
//            label: Text(
//              "${DateFormat('yyyy-mm-dd').format(_selectedDate)} ${_selectedTime.format(context)}",
//              style: TextStyle(fontSize: smallTextSize, color: lightGreyColor),
//            ),
//            avatar: Icon(
//              Icons.calendar_today,
//              size: verySmallButtonSize,
//              color: lightBlueColor,
//            ),
//            deleteIcon: Icon(
//              Icons.close,
//              size: verySmallButtonSize,
//              color: veryLightGreyColor,
//            ),
//            onDeleted: () {
//              setState(() {
//                _selectedDate = null;
//              });
//            },
//          )
//              : Container(),
//          Row(
//            children: <Widget>[
//              InkWell(
//                child: Icon(
//                  Icons.sort,
//                  color: lightBlueColor,
//                  size: smallButtonSize,
//                ),
//                onTap: () {
//                  setState(() {
//                    _detailsVisible = !_detailsVisible;
//                  });
//                },
//              ),
//              SizedBox(
//                width: normalSpace,
//              ),
//              InkWell(
//                child: Icon(
//                  Icons.date_range,
//                  color: lightBlueColor,
//                  size: smallButtonSize,
//                ),
//                onTap: () {
//                  _selectDate(context);
//                },
//              ),
//              Spacer(),
//              FlatButton(
//                  onPressed: () {},
//                  child: Text(
//                    "Save",
//                    style:
//                    TextStyle(fontSize: normalTextSize, color: lightBlueColor),
//                  ))
//            ],
//          )
//        ],
//      ),
//    );
//  }
//}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:googletasks/database/app_database.dart';
import 'package:googletasks/database/entity/task_entity.dart';
import 'package:googletasks/res.dart';
import 'package:intl/intl.dart';

class CreateTaskBottomSheet extends StatefulWidget {
  @override
  _CreateTaskBottomSheetState createState() => _CreateTaskBottomSheetState();
}

class _CreateTaskBottomSheetState extends State<CreateTaskBottomSheet> {
  bool _addDetailsVisibility = false;
  DateTime _selectedDate;
  TimeOfDay _selectedTime = TimeOfDay.now();
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();

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
      padding: EdgeInsets.only(
          top: smallSpace,
          right: smallSpace,
          left: smallSpace,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            child: TextField(
              autofocus: true,
              style: TextStyle(
                  fontSize: normalTextSize,
                  color: lightGreyColor,
                  fontFamily: 'CenturyGothic'),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'New Task',
                hintStyle: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: normalTextSize,
                  color: lightGreyColor,
                ),
              ),
            ),
          ),
          _addDetailsVisibility
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add Details',
                      hintStyle: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: verySmallTextSize,
                        color: lightGreyColor.withOpacity(
                          0.5,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          (_selectedDate != null)
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: InputChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    backgroundColor: blackColor.withAlpha(230),
                    avatar: Icon(
                      Icons.today,
                      size: verySmallButtonSize,
                      color: lightBlueColor,
                    ),
                    label: Text(
                      '${DateFormat.MMMEd().format(_selectedDate)} ${_selectedTime.format(context)}',
                      style: TextStyle(
                        color: lightGreyColor,
                      ),
                    ),
                    deleteIconColor: lightGreyColor,
                    deleteIcon: Icon(
                      Icons.close,
                      size: verySmallButtonSize,
                    ),
                    onDeleted: () {
                      _selectedDate = null;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.all(verySmallSpace),
                    onPressed: () {
                      setState(() {
                        _addDetailsVisibility = !_addDetailsVisibility;
                      });
                    },
                    minWidth: MediaQuery.of(context).size.width * 0.09,
                    child: Icon(
                      Icons.subject,
                      color: lightBlueColor,
                      size: smallButtonSize,
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.all(verySmallSpace),
                    onPressed: () {
                      _dateSelector(context);
                    },
                    minWidth: MediaQuery.of(context).size.width * 0.09,
                    child: Icon(
                      Icons.today,
                      color: lightBlueColor,
                      size: smallButtonSize,
                    ),
                  ),
                ],
              ),
              Spacer(),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: normalTextSize,
                  ),
                ),
                textColor: lightBlueColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _dateSelector(BuildContext context) async {
    DateTime newSelectedDate = await showRoundedDatePicker(
      textPositiveButton: 'Done',
      textActionButton: 'Set Time : ${_selectedTime.format(context)}',
      fontFamily: 'CenturyGothic',
      initialDatePickerMode: DatePickerMode.day,
      theme: ThemeData.dark(),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
      onTapActionButton: () {
        Navigator.pop(context);
        _timeSelector(context);
      },
    );
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate = newSelectedDate;
      });
    }
  }

  _timeSelector(BuildContext context) async {
    TimeOfDay newSelectedTime = await showRoundedTimePicker(
      theme: ThemeData.dark(),
      fontFamily: 'CenturyGothic',
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newSelectedTime != null) {
      setState(() {
        _selectedTime = newSelectedTime;
      });
    }
    _dateSelector(context);
  }

  _saveTask() async {
    String taskTitle = _taskTitleController.text;
    if (taskTitle == null || taskTitle.isEmpty) {
      return;
    }
    String taskDescription =
        _addDetailsVisibility ? _taskDescriptionController.text : null;
    DateTime selectedDate = _selectedDate;
    if (selectedDate == null) {
      selectedDate = DateTime.now();
    }
    String dateTime =
        '${DateFormat.MMMEd().format(selectedDate)} | ${_selectedTime.format(context)}';
    TaskEntity task = TaskEntity(
        taskName: taskTitle,
        taskDetails: taskDescription,
        taskDateAndTime: dateTime,
        tasksListId: 1);
    await AppDatabase.instance.taskDao.insertTask(task);
    Navigator.pop(context);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesDatePicker extends StatefulWidget {
  SalesDatePicker({Key? key}) : super(key: key);

  @override
  State<SalesDatePicker> createState() => _SalesDatePickerState();
}

class _SalesDatePickerState extends State<SalesDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Pick a Date',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(CupertinoIcons.multiply, size: 28),
                ),
              ],
            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              monthViewSettings: DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
              ),
              selectionMode: DateRangePickerSelectionMode.single,
              toggleDaySelection: true,
              showNavigationArrow: true,
              maxDate: DateTime.now(),
              onSelectionChanged: (val) {
                print(val.value);
                Navigator.pop(context, val.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

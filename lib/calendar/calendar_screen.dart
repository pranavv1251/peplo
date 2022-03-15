import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pepplo/calendar/options_screen.dart';
import 'package:pepplo/calendar/vertical_calendar_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  var now = DateTime.now();
  var formatter = DateFormat('MMM dd, yyyy');
  var date;
  late List<Meeting> appointments;
  late MeetingDataSource _events;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    date = formatter.format(now);
    appointments = _getDataSource();
    _events = MeetingDataSource(appointments);
  }

  DateTime today = DateTime.now();

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(Duration(minutes: 90));
    meetings
        .add(Meeting('Conference', startTime, endTime, Colors.amber, false));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.13),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu_rounded),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          height: 58,
                          width: 58,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Pranav'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: FaIcon(FontAwesomeIcons.sort),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: OptionsPage(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                width: double.infinity,
                height: size.height -
                    (size.height * 0.082 + size.height * 0.13 + 15),
                child: getEventCalendar(CalendarView.day, _events, onCalendarTapped),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget getEventCalendar(
    CalendarView _calendarView,
    CalendarDataSource _calendarDataSource,
    CalendarTapCallback calendarTapCallback) {
    return SfCalendar(
      view: _calendarView,
      dataSource: _calendarDataSource,
      onTap: calendarTapCallback,
      // initialDisplayDate: DateTime(DateTime.now().year, DateTime.now().month,
      //       DateTime.now().day, 0, 0, 0),
      monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      timeSlotViewSettings: TimeSlotViewSettings(
        startHour: 8,
        endHour: 22,
        timeRulerSize: 51,
        timeFormat: 'h:mm a',
        timeTextStyle: TextStyle(
          fontSize: 11,
          color: Colors.black,
        ),
        timeIntervalHeight: 200,
      ),
    );
  }

  void resizeStart(
      AppointmentResizeStartDetails appointmentResizeStartDetails) {
    dynamic appointment = appointmentResizeStartDetails.appointment;
    CalendarResource? resource = appointmentResizeStartDetails.resource;
  }

  void resizeUpdate(
      AppointmentResizeUpdateDetails appointmentResizeUpdateDetails) {
    dynamic appointment = appointmentResizeUpdateDetails.appointment;
    DateTime? resizingTime = appointmentResizeUpdateDetails.resizingTime;
    Offset? resizingOffset = appointmentResizeUpdateDetails.resizingOffset;
    CalendarResource? resourceDetails = appointmentResizeUpdateDetails.resource;
  }

  void resizeEnd(AppointmentResizeEndDetails appointmentResizeEndDetails) {
    dynamic appointment = appointmentResizeEndDetails.appointment;
    DateTime? startTime = appointmentResizeEndDetails.startTime;
    DateTime? endTime = appointmentResizeEndDetails.endTime;
    CalendarResource? resourceDetails = appointmentResizeEndDetails.resource;
  }

  void onCalendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement != CalendarElement.calendarCell &&
        calendarTapDetails.targetElement != CalendarElement.appointment) {
      return;
    }
    print(calendarTapDetails.date);
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }
    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from, to;
  Color background;
  bool isAllDay;
}







// SfCalendar(
//                   onTap: calendarTapCallback,
//                   view: CalendarView.month,
//                   firstDayOfWeek: 1,
//                   dataSource: MeetingDataSource(_getDataSource()),
//                   allowDragAndDrop: false,
//                   showDatePickerButton: true,
//                   showCurrentTimeIndicator: true,
//                   appointmentTextStyle:
//                       TextStyle(fontSize: 17, letterSpacing: 0.8),
//                   monthViewSettings: MonthViewSettings(
//                     appointmentDisplayMode:
//                         MonthAppointmentDisplayMode.appointment,
//                   ),
//                   headerDateFormat: 'MMM d',
//                   todayHighlightColor: Colors.black,
//                   allowAppointmentResize: true,
//                   onAppointmentResizeStart: resizeStart,
//                   onAppointmentResizeUpdate: resizeUpdate,
//                   onAppointmentResizeEnd: resizeEnd,
//                   cellBorderColor: Colors.blue.withOpacity(0.4),
//                   timeSlotViewSettings: TimeSlotViewSettings(
//                     startHour: 8,
//                     endHour: 22,
//                     timeRulerSize: 51,
//                     timeFormat: 'h:mm a',
//                     timeTextStyle: TextStyle(
//                       fontSize: 11,
//                       color: Colors.black,
//                     ),
//                     timeIntervalHeight: 200,
//                   ),
//                 ),
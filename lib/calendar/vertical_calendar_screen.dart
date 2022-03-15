// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

// class VerticalCalendarPage extends StatelessWidget {
//   const VerticalCalendarPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Choose a Date',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Custom(),
//     );
//   }
// }

// class Custom extends StatefulWidget {
//   Custom({Key? key}) : super(key: key);

//   @override
//   State<Custom> createState() => _CustomState();
// }

// class _CustomState extends State<Custom> {
//   @override
//   Widget build(BuildContext context) {
//     return PagedVerticalCalendar(
//       monthBuilder: ((context, month, year) {
//         return Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//               margin: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.all(Radius.circular(40)),
//               ),
//               child: Text(
//                 DateFormat('MMMM yyyy').format(DateTime(year, month)),
//                 style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                       color: Colors.white,
//                     ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 17),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   weekText('Mon'),
//                   weekText('Tue'),
//                   weekText('Wed'),
//                   weekText('Thu'),
//                   weekText('Fri'),
//                   weekText('Sat'),
//                   weekText('Sun'),
//                 ],
//               ),
//             ),
//           ],
//         );
//       }),
//       dayBuilder: (context, date) {
//         return Column(
//           children: [
//             Text(DateFormat('d').format(date)),
//             SizedBox(
//               height: 4,
//             ),
//             const Divider(),
//           ],
//         );
//       },
//       onDayPressed: (value) {
//         // print(DateFormat('MMM dd, yyyy').format(value));
//         Navigator.pop(context, DateFormat('MMM dd, yyyy').format(value));
//       },
//     );
//   }

//   Widget weekText(String text) {
//     return Padding(
//       padding: EdgeInsets.all(3.1),
//       child: Text(
//         text,
//         style: TextStyle(color: Colors.grey, fontSize: 11),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pepplo/components/menu_options.dart';
import 'package:pepplo/sales/appointments.dart';
import 'package:pepplo/sales/daily_sales.dart';

class SalesPage extends StatefulWidget {
  SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            MenuOptions(
              header: 'Daily Sales',
              desc: 'See daily totals of sales made and payments collected.',
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DailySales();
                }));
              },
            ),
            Divider(),
            MenuOptions(
              header: 'Appointments',
              desc: 'List of all appointments booked.',
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AppointmentsPage();
                }));
              },
            ),
            Divider(),
            MenuOptions(
              header: 'Sales History',
              desc: 'List of all the sales made.',
              press: () {},
            ),
            Divider(),
            MenuOptions(
              header: 'Vouchers',
              desc: 'List of all vouchers issued.',
              press: () {},
            ),
            Divider(),
            MenuOptions(
              header: 'Memberships',
              desc: 'List of all memberships issued.',
              press: () {},
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

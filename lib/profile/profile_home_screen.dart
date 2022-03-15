import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileHomePage extends StatefulWidget {
  ProfileHomePage({Key? key}) : super(key: key);

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  late TooltipBehavior _tooltipBehavior;
  late TooltipBehavior _secondBehavior;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tooltipBehavior =
        TooltipBehavior(enable: true, activationMode: ActivationMode.singleTap, duration: 2105);
    _secondBehavior =
        TooltipBehavior(enable: true, activationMode: ActivationMode.singleTap,duration: 2105);
  }

  @override
  Widget build(BuildContext context) {

    final List<SalesData> chartData = <SalesData>[
           SalesData(DateTime.now().subtract(Duration(days: 6)),48, 50),
           SalesData(DateTime.now().subtract(Duration(days: 5)),34, 40),
           SalesData(DateTime.now().subtract(Duration(days: 4)),42, 24),
           SalesData(DateTime.now().subtract(Duration(days: 3)),13, 22),
           SalesData(DateTime.now().subtract(Duration(days: 2)),58, 44),
           SalesData(DateTime.now().subtract(Duration(days: 1)),56, 70),
           SalesData(DateTime.now(),24, 40),
        ];


    final List<SalesData> secondChart = <SalesData>[
           SalesData(DateTime.now().subtract(Duration(days: 6)),48, 50),
           SalesData(DateTime.now().subtract(Duration(days: 5)),34, 40),
           SalesData(DateTime.now().subtract(Duration(days: 4)),42, 24),
           SalesData(DateTime.now().subtract(Duration(days: 3)),13, 22),
           SalesData(DateTime.now().subtract(Duration(days: 2)),58, 44),
           SalesData(DateTime.now().subtract(Duration(days: 1)),56, 70),
           SalesData(DateTime.now(),24, 40),
        ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 6),
                child: Text(
                  'Recent Sales Data',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(19, 40, 19, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Appointments  ',
                          ),
                          TextSpan(
                            text: '7',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SfCartesianChart(
                      tooltipBehavior: _tooltipBehavior,
                      primaryXAxis: DateTimeCategoryAxis(
                        intervalType: DateTimeIntervalType.days,
                        labelRotation: 300,
                        labelAlignment: LabelAlignment.start,
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        labelPlacement: LabelPlacement.onTicks,
                      ),
                      series: <ChartSeries>[
                        LineSeries<SalesData, DateTime>(
                          color: Color.fromARGB(255, 8, 103, 180),
                          name: 'Sales',
                          enableTooltip: true,
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.date,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                        LineSeries<SalesData, DateTime>(
                          color: Color.fromARGB(255, 7, 163, 20),
                          name: 'Appointments',
                          enableTooltip: true,
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.date,
                          yValueMapper: (SalesData sales, _) => sales.app)
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 6),
                child: Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(19, 40, 19, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Appointments  ',
                          ),
                          TextSpan(
                            text: '7',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SfCartesianChart(
                      tooltipBehavior: _secondBehavior,
                      primaryXAxis: DateTimeCategoryAxis(
                        intervalType: DateTimeIntervalType.days,
                        labelRotation: 300,
                      ),
                      series: <ChartSeries>[
                        ColumnSeries<SalesData, DateTime>(
                          color: Color.fromARGB(255, 8, 103, 180),
                          name: 'Sales',
                          enableTooltip: true,
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.date,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                        ColumnSeries<SalesData, DateTime>(
                          color: Color.fromARGB(255, 7, 163, 20),
                          name: 'Appointments',
                          enableTooltip: true,
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.date,
                          yValueMapper: (SalesData sales, _) => sales.app)
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 6),
                child: Text(
                  'Appointments Activity',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 31, 29, 29),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(11, 20, 19, 11),
                child: Column(
                  children: [
                    Appointments(),
                    Appointments(),
                  ],
                ),
              ),
              SizedBox(
                height: 51,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Appointments extends StatelessWidget {
  const Appointments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(DateFormat('dd').format(DateTime.now()), style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(DateFormat('MMM').format(DateTime.now()), style: TextStyle(
                    fontSize: 15,
                  ),),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('EEE, dd MMM yyyy  hh:mm aa').format(DateTime.now()), style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 133, 132, 132),
                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text('Accupuncture Treatment', style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Text('Pranav', style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 133, 132, 132),
                ),),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rs. 80', style: TextStyle(
                  fontSize: 19,
                    fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

class SalesData {
  SalesData(this.date, this.sales, this.app);
  final DateTime date;
  final double? sales;
  final double? app;
}


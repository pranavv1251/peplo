import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pepplo/sales/sales_datepicker.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class AppointmentsPage extends StatefulWidget {
  AppointmentsPage({Key? key}) : super(key: key);
  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}





class _AppointmentsPageState extends State<AppointmentsPage> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  String date = DateFormat('dd, MMM yyyy').format(DateTime.now());

  void getData() async {
    Route route = MaterialPageRoute(builder: (context) {
      return SalesDatePicker();
    });
    var s = await Navigator.push(context, route);
    setState(() {
      date = DateFormat('dd, MMM yyyy').format(s);
    });
  }

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Appointments',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getData();
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '$date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                    'View the transactions and cash movements for the day.'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 42.0),
                child: Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black12
                              )
                            ),
                          ),
                          child: Center(
                            child: Text('Ref. Id'),
                          ),
                          width: size.width * 0.2,
                          height: size.height * 0.17,
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: employees.length,
                              itemBuilder: (context, index) {
                                return AppointmentNameContainer(
                                  size: size, 
                                );
                              }),
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Container(
                    //       height: 31,
                    //       width: size.width * 0.2,
                    //       color: Colors.amber,
                    //     ),
                    //     Container(
                    //       height: 31,
                    //       color: Colors.green,
                    //       width: size.width * 0.2,
                    //     ),
                    //     AppointmentNameContainer(
                    //       size: size,
                    //       color: Colors.amber,
                    //     ),
                    //   ],
                    // ),
                    Container(
                      height: (size.height * 0.08 * employees.length) + size.height * 0.17,
                      child: SfDataGridTheme(
                        data: SfDataGridThemeData(
                          gridLineColor: Colors.black12,
                          gridLineStrokeWidth: 0.6,
                        ),
                        child: SfDataGrid(
                          source: employeeDataSource,
                          verticalScrollPhysics: NeverScrollableScrollPhysics(),
                          onQueryRowHeight: (val) {
                            return val.rowIndex == 0
                                ? size.height * 0.17
                                : size.height * 0.08;
                          },
                          horizontalScrollPhysics:
                              AlwaysScrollableScrollPhysics(),
                          columns: [
                            GridColumn(
                                columnName: 'id',
                                width: size.width / 5,
                                label: Container(
                                    alignment: Alignment.centerRight,
                                    child: Center(
                                      child: Text(
                                        'ID',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))),
                            GridColumn(
                                columnName: 'name',
                                width: size.width / 4,
                                label: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                      child: Text(
                                        'Name',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))),
                            GridColumn(
                                columnName: 'designation',
                                width: size.width / 4,
                                label: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                      child: Text(
                                        'Designation',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))),
                            GridColumn(
                                columnName: 'salary',
                                width: size.width / 3.7,
                                label: Container(
                                      alignment: Alignment.topLeft,
                                      padding:EdgeInsets.only(left:8),
                                      margin: EdgeInsets.only(right:8),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Salary',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class AppointmentNameContainer extends StatelessWidget {
  const AppointmentNameContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 0.6),
          
        ),
      ),
      child: Center(
        child: Text('#123'),
      ),
    );
  }
}

List<Employee> getEmployeeData() {
  return [
    Employee(10001, 'James', 'Project Lead', 20000),
    Employee(10002, 'Kathryn', 'Manager', 30000),
    Employee(10003, 'Lara', 'Develasdfffffffffffffffffffffffffffffffffffffoper', 15000),
    Employee(10004, 'Michael', 'Designer', 15000),
    Employee(10005, 'Martin', 'Developer', 15000),
    Employee(10006, 'Newberry', 'Developer', 15000),
    Employee(10007, 'Balnc', 'Developer', 15000),
  ];
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

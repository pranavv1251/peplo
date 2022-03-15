import 'package:flutter/material.dart';

class IndClientPage extends StatefulWidget {
  IndClientPage({Key? key}) : super(key: key);

  @override
  State<IndClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<IndClientPage> {
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
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(52),
                child: Container(
                  height: 105,
                  width: 105,
                  color: Color.fromARGB(255, 170, 210, 243),
                  child: Center(
                    child: Text(
                      'P',
                      style: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 40, 68),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Pranav Gangurde',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

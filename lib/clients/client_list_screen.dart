import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pepplo/clients/client_screen.dart';
import 'package:pepplo/clients/individual_client_page.dart';

class ClientListPage extends StatefulWidget {
  ClientListPage({Key? key}) : super(key: key);

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () {},
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
                      'Clients',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child:
                    Text('View, add, edit and delete your client\'s details'),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 31,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ClientItem(
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return IndClientPage();
                          }));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClientItem extends StatelessWidget {
  final Function()? press;
  const ClientItem({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(33),
                      child: Container(
                        height: 66,
                        width: 66,
                        color: Color.fromARGB(255, 196, 223, 245),
                        child: Center(
                          child: Text(
                            'J',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 6, 36, 61),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              'Jane Doe',
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ),
                          Text(
                            'abc@gmail.com',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(197, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(children: [
                  Text('9689558750'),
                ]),
              ],
            ),
            Divider(color: Color.fromARGB(255, 199, 198, 198)),
          ],
        ),
      ),
    );
  }
}

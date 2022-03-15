import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pepplo/clients/client_list_screen.dart';
import 'package:pepplo/clients/reviews_screen.dart';
import 'package:pepplo/components/menu_options.dart';

class ClientPage extends StatefulWidget {
  ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
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
              header: 'Clients List',
              desc: 'Add, View, Edit or Delete your Client Details.',
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ClientListPage();
                }));
              },
            ),
            Divider(),
            MenuOptions(
              header: 'Reviews',
              desc: 'View feedback submitted by clients.',
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ReviewsPage();
                }));
              },
            ),
            Divider(),
            MenuOptions(
              header: 'Forms',
              desc: 'Manage your forms.',
              press: () {},
            ),
            Divider(),
            MenuOptions(
              header: 'Notifications',
              desc: 'Review messages sent to client about their appointments.',
              press: () {},
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

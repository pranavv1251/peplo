import 'package:flutter/material.dart';
import 'package:pepplo/home_navbar/main_navbar.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
          width: double.infinity,
          // height: size.height - size.height * 0.15,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(57),
                        ),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.black,
                        ),
                        color: Color.fromARGB(255, 217, 237, 253),
                      ),
                      height: 114,
                      width: 114,
                      child: Center(
                          child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 28,
                        color: Color.fromARGB(255, 5, 57, 100),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Text(
                  'Personal Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Set your name and contact information, the email address entered here is used for login access',
                ),
                ProfileInputField(
                  text: 'First Name',
                ),
                ProfileInputField(
                  text: 'Last Name',
                ),
                ProfileInputField(
                  text: 'Mobile Number',
                ),
                ProfileInputField(
                  text: 'Email',
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'To update, enter your existing password and a new password.',
                ),
                ProfileInputField(
                  text: 'Old Password',
                ),
                ProfileInputField(
                  text: 'New Password',
                ),
                ProfileInputField(
                  text: 'Verify Password',
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Social Accounts',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Link up your social media accounts with Pepplo.',
                ),
                SizedBox(
                  height: 8,
                ),
                SocialMediaConnect(
                  name: 'Google'
                ),
                SocialMediaConnect(
                  name: 'Facebook'
                ),
                SocialMediaConnect(
                  name: 'Instagram'
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(204, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: 53,
                    width: size.width * 0.42,
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaConnect extends StatelessWidget {
  final String name;
  const SocialMediaConnect({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    height: 56,
                    width: 56,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Not connected',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 80,
              height: 31,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text('Connect'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileInputField extends StatelessWidget {
  final String text;
  const ProfileInputField({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 24,
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 6,
      ),
      Container(
        height: 44,
        child: TextField(
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

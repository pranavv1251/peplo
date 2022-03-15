import 'package:flutter/material.dart';
import 'package:pepplo/profile/my_profile_page.dart';
import 'package:pepplo/profile/profile_home_screen.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: size.height - size.height * 0.15,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.022,
                    horizontal: size.width * 0.051),
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(46),
                      ),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black,
                      ),
                      color: Color.fromARGB(255, 217, 237, 253),
                    ),
                    height: 96,
                    width: 96,
                    child: Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 57, 100),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    'Pranav Gangurde',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyProfile();
                      }));
                    },
                    child: Text(
                      'My Profile >',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 53, 140, 211),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ProfilePageOptions(
                    text: 'Home',
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfileHomePage();
                      }));
                    },
                    icon: Icons.home_outlined,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ProfilePageOptions(
                    text: 'Inventory',
                    press: () {},
                    icon: Icons.production_quantity_limits_outlined,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ProfilePageOptions(
                    text: 'Website',
                    press: () {},
                    icon: Icons.desktop_windows_rounded,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ProfilePageOptions(
                    text: 'Promote',
                    icon: Icons.speaker_group_outlined,
                    press: () {},
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ProfilePageOptions(
                    text: 'Reports',
                    press: () {},
                    icon: Icons.note,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ProfilePageOptions(
                    text: 'Business Settings',
                    press: () {},
                    icon: Icons.settings,
                  ),
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.022,
                    horizontal: size.width * 0.051),
                child: Column(
                  children: [
                    ProfilePageOptions(
                        text: 'English', icon: Icons.flag, press: () {}),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Help & Contact',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ]),
                        Divider(),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Log Out',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ],
                              ),
                            ]),
                        Divider(),
                      ],
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

class ProfilePageOptions extends StatelessWidget {
  final Function()? press;
  final IconData icon;
  final String text;
  const ProfilePageOptions({
    Key? key,
    required this.icon,
    required this.text,
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios),
            ]),
            Divider(),
          ],
        ),
      ),
    );
  }
}

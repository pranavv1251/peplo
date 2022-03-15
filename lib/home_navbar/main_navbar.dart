import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pepplo/calendar/calendar_screen.dart';
import 'package:pepplo/clients/client_screen.dart';
import 'package:pepplo/notification/notification_screen.dart';
import 'package:pepplo/profile/profile_screen.dart';
import 'package:pepplo/sales/sales_screen.dart';

class NavbarPage extends StatefulWidget {
  NavbarPage({Key? key}) : super(key: key);

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual , overlays:[SystemUiOverlay.bottom]);
  }


  int _currentIndex = 2;

  final pages = [
    ClientPage(),
    SalesPage(),
    CalendarPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return _buildOriginDesign();
  }

  Widget _buildOriginDesign() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.082,
      child: CustomNavigationBar(
        selectedColor: Colors.black,
        unSelectedColor: Colors.black,
        iconSize: 26,
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: _currentIndex==0 ? FaIcon(FontAwesomeIcons.users, color: Colors.amber):FaIcon(FontAwesomeIcons.users),
          ),
          CustomNavigationBarItem(
            icon: _currentIndex==1 ? FaIcon(FontAwesomeIcons.tags, color: Colors.amber):FaIcon(FontAwesomeIcons.tags),
          ),
          CustomNavigationBarItem(
            icon: _currentIndex==2 ? FaIcon(FontAwesomeIcons.calendarWeek, color: Colors.amber):FaIcon(FontAwesomeIcons.calendarWeek,),
          ),
          CustomNavigationBarItem(
            icon: _currentIndex==3 ? FaIcon(FontAwesomeIcons.solidBell, color: Colors.amber):FaIcon(FontAwesomeIcons.solidBell),
          ),
          CustomNavigationBarItem(
            icon: _currentIndex==4 ? Image.asset('assets/images/selectedCandy.png') : Image.asset('assets/images/candy.png'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
    );
  }
}

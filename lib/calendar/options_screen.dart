import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 15, right: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel_outlined, size: 40),
                ),
              ],
            ),
            SizedBox(
              height: 31,
            ),
            Text(
              'Calendar View',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ViewType(
                  icon: Icons.calendar_view_day_outlined,
                  text: 'Day',
                  press: () {},
                ),
                ViewType(
                  icon: Icons.next_week_outlined,
                  text: 'Week',
                  press: () {},
                ),
                ViewType(
                  icon: Icons.calendar_view_month_outlined,
                  text: 'Month',
                  press: () {},
                ),
              ],
            ),
            SizedBox(
              height: 31,
            ),
            Text(
              'Team Members',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(
              height: 15,
            ),
            TeamMember(),
            TeamMember(),
            TeamMember(),
          ],
        ),
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  const TeamMember({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.person, size: 26,),
            SizedBox(
              width: 8,
            ),
            Text(
              'Pranav Gangurde',
              style: TextStyle(
                fontSize:17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewType extends StatelessWidget {
  final Function()? press;
  final IconData icon;
  final String text;
  const ViewType({
    Key? key,
    required this.text,
    required this.press,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print(text);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Icon(icon),
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

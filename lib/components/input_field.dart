import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final IconData icon;
  const InputField({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(title),
        Container(
          padding: EdgeInsets.only(top: 4),
          height: 44,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(icon),
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
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}

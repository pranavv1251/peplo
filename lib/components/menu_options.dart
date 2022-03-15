import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget {
  final String header, desc;
  final Function()? press;
  const MenuOptions({
    Key? key,
    required this.header,
    required this.desc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    header,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      desc,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 19,
            )
          ],
        ),
      ),
    );
  }
}

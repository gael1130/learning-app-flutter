import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learningapp/theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.deepPurple,
      // selectedLabelStyle: TextStyle(
      //     fontWeight: FontWeight.w900, fontSize: 20, color: Colors.amberAccent),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.graduationCap,
            size: 20,
          ),
          label: "Topics",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bolt,
            size: 20,
          ),
          label: "About",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.circleUser,
            size: 20,
          ),
          label: "Profile",
        ),
      ],
      // fixedColor: Colors.deepPurple[200],
      fixedColor: const Color.fromRGBO(18, 32, 47, 1),
      // fixedColor: Colors.yellow,
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // Do nothing
            break;
          case 1:
            Navigator.pushNamed(context, "/about");
            break;
          case 2:
            Navigator.pushNamed(context, "/profile");
            break;
        }
      },
    );
  }
}

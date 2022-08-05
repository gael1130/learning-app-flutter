import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/models.dart';
import '../theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About this app"),
      ),
      body: Center(
        child: Text(
          'Made by Gael Gendre \nAugust 2022 \ngaelgendre@proton.me',
          style: TextStyle(fontSize: 27), textAlign: TextAlign.center,
        ),
      ),
      // body: Column(
      //     // crossAxisAlignment: CrossAxisAlignment.end,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Made by Gael Gendre", style: TextStyle(fontSize: 27), textAlign: TextAlign.center,),
      //       Text("August 2022", style: TextStyle(fontSize: 27),),
      //       Text("gaelgendre@proton.me", style: TextStyle(fontSize: 27),)
      //     ],
      //   ),
      // child: Center(
      //   child: Text("Made by Gael Gendre, August 2022. Contact: gaelgendre@proton.me ", style: TextStyle(fontSize: 27),),
      // ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("About this app"),
    //   ),
    //   body: Container(
    //     child: Text(
    //       "HELLO THERE",
    //       style: TextStyle(
    //           fontSize: 55,
    //           color: Colors.white54,
    //           // fontFamily: GoogleFonts.abhayaLibre().fontFamily),
    //     ),
    //   ),
    //   ),
    // );
  }
}

class MyQuizzesScoreCard extends StatelessWidget {
  const MyQuizzesScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);

    return Center(
      child: Card(
        // color: Theme.of(context).colorScheme.surfaceVariant,

        color: darkBlue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                FontAwesomeIcons.graduationCap,
                size: 28,
                color: Colors.white70,
              ),
              title: Text('${report.total} Quizzes Completed',
                  style: TextStyle(color: Colors.white70, fontSize: 28)),
              // title: Text(
              //   'report.total 0 Quizzes Completed',
              //   style: TextStyle(color: Colors.white70, fontSize: 28),
              // ),
              // title: Center(
              //     child: Text(
              //   "0 Quizzes Completed", textAlign: TextAlign.start,
              // )),
              // subtitle: Text("Por Favor"),
            ),
          ],
        ),
      ),
    );
  }
}

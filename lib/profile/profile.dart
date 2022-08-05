import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learningapp/services/auth.dart';
import 'package:learningapp/theme.dart';
import 'package:provider/provider.dart';

import '../services/models.dart';
import '../shared/loading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: violet,
          title: Text(
            user.displayName ?? 'Guest',
            // style: TextStyle(fontWeight: FontWeight.w900, fontSize: 27),
          ),
          // centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfilePic(),
            // Spacer(),
            MyQuizzesScoreCard(),
            // Spacer(),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () async {
                await AuthService().signout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ],
        ),
      );
    } else {
      return Loader();
    }
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;

    if (user?.photoURL != null) {
      return CircleAvatar(
        backgroundImage: NetworkImage(
          '${user?.photoURL}',
        ),
        radius: 75,
      );
    } else {
      return SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage: AssetImage(
            user?.photoURL ?? "assets/incognito.png",
          ),
        ),
      );
    }

//potentially add a change picture option
    // return SizedBox(
    //   height: 115,
    //   width: 115,
    //   child: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       CircleAvatar(
    //         backgroundImage: AssetImage(user?.photoURL ?? "assets/guest.png"),
    //       ),
    //       Positioned(
    //         bottom: 2,
    //         right: 0,
    //         child: SizedBox(
    //           height: 46,
    //           width: 46,
    //           child: RawMaterialButton(
    //             onPressed: () {},
    //             shape: CircleBorder(),
    //             fillColor: Colors.grey.shade300,
    //             child: IconButton(
    //               icon: FaIcon(FontAwesomeIcons.camera),
    //               onPressed: () {},
    //               color: darkBlue,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
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

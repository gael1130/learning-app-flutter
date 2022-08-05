import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../shared/bottom_navbar.dart';
import 'package:learningapp/services/auth.dart';
import 'package:learningapp/login/login.dart';
import 'package:learningapp/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading");
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("error"),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
    // return Scaffold(
    //   body: Center(
    //     child: ElevatedButton(
    //       child: Text("about", style: Theme.of(context).textTheme.button,),
    //       onPressed: () => Navigator.pushNamed(context, '/about'),
    //     ),

    //   ),
    //   bottomNavigationBar: TheBottomNavBar(),
    // );
    // return Container();
  }
}

import "package:learningapp/about/about.dart";
import "package:learningapp/home/home.dart";
import 'package:learningapp/profile/profile.dart';
import 'package:learningapp/login/login.dart';
import 'package:learningapp/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
};

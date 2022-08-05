import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learningapp/services/firestore.dart';
import 'package:learningapp/shared/bottom_navbar.dart';
import 'package:learningapp/shared/error.dart';
import 'package:learningapp/shared/loading.dart';
import 'package:learningapp/topics/topic_item.dart';

import '../services/models.dart';
import 'drawer.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
              // centerTitle: true,
            ),

            drawer: TopicDrawer(topics: topics),

            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics
                  .map((topic) => TopicItem(topic: topic,
                        // topic.title,
                        style: TextStyle(color: Colors.white70),
                      ))
                  .toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          return const Text('No topics found in Firestore. Check database');
        }
      },
    );
  }
}

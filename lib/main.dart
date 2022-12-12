import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/create_post.dart';
import 'package:instagram_clone/pages/home.dart';
import 'package:instagram_clone/pages/notifications.dart';
import 'package:instagram_clone/pages/profile.dart';
import 'package:instagram_clone/pages/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
              color: Colors
                  .white), // This is making the text white, research how this actually works
          caption: TextStyle(color: Colors.white),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pages = const [
    Home(),
    Search(),
    CreatePost(),
    Notifications(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          // TODO: create dark/light mode.
          backgroundColor: Colors.black,
          appBar: AppBar(title: const Text('Instagram')),
          body: TabBarView(children: pages),
          bottomNavigationBar: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.add)),
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
      ),
    );
  }
}

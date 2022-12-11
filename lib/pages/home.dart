import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/widgets/post_widget.dart';
import 'package:flutter/services.dart' show rootBundle;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // return const Post(username: 'joaquin');
    return FutureBuilder<PostModel>(
      future: loadAsset(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Post(post: snapshot.data!);
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Text('loading');
      }),
    );
  }
}

Future<PostModel> loadAsset() async {
  String jsonString = await rootBundle.loadString('lib/mocks/post.json');
  Map<String, dynamic> userMap = jsonDecode(jsonString);
  var post = PostModel.fromJson(userMap);
  return post;
}

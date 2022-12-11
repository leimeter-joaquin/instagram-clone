import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/models/post_model.dart';

class Post extends StatefulWidget {
  const Post({super.key, required this.post});

  final PostModel post;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.post.user.avatar),
                  ),
                  const Gap(10),
                  Column(children: getUserHeaderInfo(widget.post)),
                ],
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),

        // we are using a container here because we might need to add something on top of the image in the future. We could probably have the image as a background instead of a child.

        Container(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.post.image),
            ),
          ),
        ),

        // Icons Row
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite),
                  Gap(10),
                  Icon(Icons.favorite),
                  Gap(10),
                  Icon(Icons.arrow_back),
                ],
              ),
              // Image navigator
              const Icon(Icons.save)
            ],
          ),
        ),

        // Like counter
        Text(
          widget.post.likes.toString(),
          textAlign: TextAlign.start,
        ),

        // Description
        Container(
          decoration: const BoxDecoration(color: Colors.amber),
          child: Text(widget.post.description),
        ),

        // Comments teaser
        Container(
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Text('Click to see the comments'),
        ),

        // Time Stamp
      ],
    );
  }
}

List<Widget> getUserHeaderInfo(PostModel post) {
  return [
    Text(post.user.name),
    Text(
      post.location,
      style: const TextStyle(fontSize: 10),
    )
  ];
}

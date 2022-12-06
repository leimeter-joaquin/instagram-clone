import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Post extends StatefulWidget {
  const Post({super.key, required this.username});

  final String username;

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
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://picsum.photos/id/400/400'),
                  ),
                  const Gap(10),
                  Column(children: getUserHeaderInfo(widget.username)),
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/id/600/600'),
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
        // TODO:make this dinamic
        const Text(
          '300 likes',
          textAlign: TextAlign.start,
        ),

        // Comments teaser
        Container()

        // Time Stamp
      ],
    );
  }
}

// TODO: Here we should check whether we should display the place description or not
List<Widget> getUserHeaderInfo(username) {
  return [
    Text(username),
    const Text(
      'Place description',
      style: TextStyle(fontSize: 10),
    )
  ];
}

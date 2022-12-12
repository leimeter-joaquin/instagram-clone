import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/models/post_model.dart';

// This widget usese different methods to get the different parts we need to construct the widget.
// In some cases we use a function to return  List of Wigets, in others we return a String and use it in a Widget. There are many ways of doing what we need.
class Post extends StatefulWidget {
  const Post({super.key, required this.post});

  final PostModel post;

  @override
  State<Post> createState() => _PostState();
}

const verticalGap = 5.0;
const horizontalGap = 10.0;

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
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
                  const Gap(horizontalGap),
                  Column(children: getUserHeaderInfo(widget.post)),
                ],
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),

        // Image.
        // We are using a container here because we might need to add something on top of the image in the future. We could probably have the image as a background instead of a child.
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(),
                          onPressed: () => {},
                          icon: const Icon(Icons.favorite_border)),
                      const Gap(horizontalGap),
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(),
                          onPressed: () => {},
                          icon: const Icon(Icons.access_alarm_rounded)),
                      const Gap(horizontalGap),
                      IconButton(
                          padding: const EdgeInsets.all(0),
                          constraints: const BoxConstraints(),
                          onPressed: () => {},
                          icon: const Icon(Icons.abc)),
                    ],
                  ),
                  // Image navigator
                  const Icon(Icons.save)
                ],
              ),

              const Gap(verticalGap),

              // Like counter
              Text(
                widget.post.likes.toString(),
                textAlign: TextAlign.start,
              ),

              const Gap(verticalGap),

              // Description
              getDescription(widget.post),

              const Gap(verticalGap),

              // Comments teaser
              Text(
                getCommentTeaserText(widget.post),
                style: const TextStyle(color: Colors.white60),
              ),

              const Gap(verticalGap),

              // Time Stamp
              Text(widget.post.timestamp.year.toString())
            ],
          ),
        ),
      ],
    );
  }
}

// 1. Here we return just the children List
List<Widget> getUserHeaderInfo(PostModel post) {
  return [
    Text(post.user.name),
    Text(
      post.location,
      style: const TextStyle(fontSize: 10),
    )
  ];
}

// 2. Here we return the whole Row Widget.
Widget getDescription(PostModel post) {
  /// This assignment to a local String is done because you can not promote a field of an object.
  /// Promote being that dart knows this field is definitely not null.
  /// check: https://dart.dev/tools/non-promotion-reasons#property-or-this
  String? description = post.description;

  //We always return a Widget because the "children" property of the parent Column expects a Widget, I don't know why we cannot just return Row | null.
  if (description != null) {
    return Row(
      children: [
        Text(
          post.user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(5),
        Text(post.description!),
      ],
    );
  } else {
    return Container();
  }
}

// 3. And here we return the String and use it inside the Text widget.
String getCommentTeaserText(PostModel post) {
  // Is this recommended is any way? Perhaps I should just use the "post" param and not create anotherspace in memory for the new List.
  List<Comment> comments = post.comments;
  if (comments.isEmpty) return 'No Comments... yet!';
  if (comments.length == 1) return 'See the first comment';
  return 'View all ${comments.length.toString()} comments';
}

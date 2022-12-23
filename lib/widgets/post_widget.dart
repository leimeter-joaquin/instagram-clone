import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/models/post_model.dart';

class Post extends StatelessWidget {
  final PostModel post;

  const Post({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          user: post.user,
          location: post.location,
        ),
        ImageCarousel(images: post.images),
        const Description(),
        const Comments(),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key, required this.user, this.location});
  final UserData user;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserInformation(
            user: user,
            location: location,
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({super.key, required this.user, this.location});

  final UserData user;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        const Gap(8),
        Column(
          children: [
            Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              location!,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key, required this.images});

  final List<String> images;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int activeIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getCarousel(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {
                    //
                  },
                  iconSize: 30,
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {
                    //
                  },
                  iconSize: 30,
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {
                    //
                  },
                  iconSize: 30,
                )
              ],
            ),
            const Icon(Icons.abc)
          ],
        ),
      ],
    );
  }

  Stack _getCarousel() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.images.length,
          itemBuilder: ((context, index, realIndex) {
            return Image.network(
              widget.images[index],
              width: 400,
              fit: BoxFit.cover,
            );
          }),
          options: CarouselOptions(
            height: 400,
            enableInfiniteScroll: false,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: -32,
          left: 0,
          right: 0,
          child: _getImagePositionIndicators(),
        )
      ],
    );
  }

  Widget _getImagePositionIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.images.asMap().entries.map((entry) {
        return Container(
          width: activeIndex == entry.key ? 5 : 4,
          height: activeIndex == entry.key ? 5 : 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: activeIndex == entry.key
                  ? Colors.blue
                  : Colors.white.withOpacity(0.4)),
        );
      }).toList(),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

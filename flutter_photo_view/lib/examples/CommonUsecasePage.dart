import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyButtonNode.dart';
import 'package:photo_view/photo_view.dart';

import '../common/CommonRouteWrapper.dart';
import '../common/MyAppBar.dart';

class CommonUseCasePage extends StatelessWidget {
  const CommonUseCasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
      title: 'Common Use Case',
      child: ListView(
        children: [
          MyButtonNode(
              title: 'Large Image',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommonRouteWrapper(
                      imageProvider: AssetImage("assets/large-image.jpg"),
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Large Image (filter quality: medium)',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommonRouteWrapper(
                      imageProvider: AssetImage("assets/large-image.jpg"),
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Small Image (Custom Background)',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommonRouteWrapper(
                      imageProvider: AssetImage("assets/small-image.jpg"),
                      backgroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey],
                          stops: [0.1, 0.1],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Large Image (Custom Alignment)',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommonRouteWrapper(
                      imageProvider: AssetImage("assets/small-image.jpg"),
                      backgroundDecoration: BoxDecoration(color: Colors.white),
                      basePosition: Alignment(0.5, 0.0),
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Animation Gif',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommonRouteWrapper(
                      imageProvider: AssetImage("assets/neat.gif"),
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Limited Scale',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CommonRouteWrapper(
                      imageProvider: const AssetImage("assets/large-image.jpg"),
                      minScale: PhotoViewComputedScale.contained * 0.8,
                      maxScale: PhotoViewComputedScale.covered * 1.1,
                      initialScale: PhotoViewComputedScale.covered * 1.1,
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Custom Initial Scale',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CommonRouteWrapper(
                      imageProvider: const AssetImage("assets/large-image.jpg"),
                      initialScale: PhotoViewComputedScale.contained * 0.7,
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'No Gesture',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommonRouteWrapper(
                      imageProvider: AssetImage("assets/large-image.jpg"),
                      disableGestures: true,
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'On Tap to Dismiss',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OneTapWrapper(
                      imageProvider: AssetImage("assets/large-image.jpg"),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class OneTapWrapper extends StatelessWidget {
  const OneTapWrapper({super.key, required this.imageProvider});

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: GestureDetector(
          onTapDown: (_) {
            Navigator.pop(context);
          },
          child: PhotoView(
            imageProvider: imageProvider,
          ),
        ),
      ),
    );
  }
}

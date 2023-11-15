import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:photo_view/photo_view.dart';

class InlinePage extends StatelessWidget {
  const InlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
      title: 'Inline Usage',
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'Example of usage in a contained context',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            height: 200.0,
            child: ClipRect(
              child: PhotoView(
                imageProvider: const AssetImage('assets/large-image.jpg'),
                maxScale: PhotoViewComputedScale.covered * 2.0,
                minScale: PhotoViewComputedScale.contained * 0.8,
                initialScale: PhotoViewComputedScale.covered,
              ),
            ),
          )
        ],
      ),
    );
  }
}

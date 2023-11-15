import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:photo_view/photo_view.dart';

class GestureRotationPage extends StatelessWidget {
  const GestureRotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
      title: 'Rotation',
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'Example using enableRotation, just pinch an rotate',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Expanded(child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 300.0,
            child: ClipRect(
              child: PhotoView(
                imageProvider: const AssetImage('assets/large-image.jpg'),
                maxScale: PhotoViewComputedScale.covered,
                initialScale: PhotoViewComputedScale.contained * 0.8,
                enableRotation: true,
              ),
            ),
          ))
        ],
      ),
    );
  }
}

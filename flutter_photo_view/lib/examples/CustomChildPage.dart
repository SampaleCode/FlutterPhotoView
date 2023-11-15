import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';

class CustomChildPage extends StatelessWidget {
  const CustomChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
      title: 'Custom Child',
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'Example of usage with something different than a image',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            height: 450.0,
            child: ClipRect(
              child: PhotoView.customChild(
                initialScale: 1.0,
                child: Container(
                  decoration:
                      const BoxDecoration(color: Colors.lightGreenAccent),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'This is a test, that is a svg',
                        style: TextStyle(fontSize: 12.0),
                        textAlign: TextAlign.center,
                      ),
                      SvgPicture.asset(
                        'assets/firefox.svg',
                        height: 250.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/CommonRouteWrapper.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:flutter_photo_view/common/MyButtonNode.dart';

class NetworkImagesPage extends StatelessWidget {
  const NetworkImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
      title: 'Network',
      child: ListView(
        children: [
          MyButtonNode(
              title: 'Image from the Internet (with custom loader)',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CommonRouteWrapper(
                      imageProvider: const NetworkImage(
                          "https://source.unsplash.com/1900x3600/?camera,paper"),
                      loadingBuilder: (context, event) {
                        if (event == null) {
                          return const Center(
                            child: Text('Loading...'),
                          );
                        }

                        final value = event.cumulativeBytesLoaded /
                            (event.expectedTotalBytes ??
                                event.cumulativeBytesLoaded);

                        final percentage = (100 * value).floor();

                        return Center(
                          child: Text("$percentage%"),
                        );
                      },
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Error Image',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommonRouteWrapper(
                      imageProvider:
                          NetworkImage("https://pudim.com.br/sss.jpg"),
                      backgroundDecoration:
                          BoxDecoration(color: Color(0xffa1a1a1)),
                    ),
                  ),
                );
              }),
          MyButtonNode(
              title: 'Error Image with custom error screen',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CommonRouteWrapper(
                      imageProvider:
                          const NetworkImage("https://pudim.com.br/sss.jpg"),
                      errorBuilder: (_, __, ___) {
                        return Column(
                          children: [
                            Image.asset("assets/neat.gif"),
                            const Text("Error Something...")
                          ],
                        );
                      },
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:photo_view/photo_view.dart';

class HeroAnimationPage extends StatelessWidget {
  const HeroAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
      title: 'Hero',
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HeroPhotoRouteWrapper(
                  imageProvider: NetworkImage(
                      "https://source.unsplash.com/4900x3600/?camera,paper"),
                ),
              ),
            );
          },
          child: Hero(
            tag: 'someTag',
            child: Image.network(
                'https://source.unsplash.com/4900x3600/?camera,paper',
                width: 350.0,
                loadingBuilder: (_, child, chunk) =>
                    chunk != null ? const Text('Loading...') : child),
          ),
        ),
      ),
    );
  }
}

class HeroPhotoRouteWrapper extends StatelessWidget {
  const HeroPhotoRouteWrapper(
      {super.key,
      required this.imageProvider,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale});

  final ImageProvider imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.expand(height: MediaQuery.of(context).size.height),
      child: PhotoView(
        imageProvider: imageProvider,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: const PhotoViewHeroAttributes(tag: 'someTag'),
      ),
    );
  }
}

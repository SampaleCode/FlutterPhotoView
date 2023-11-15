import 'package:flutter/widgets.dart';

class GalleryItem {
  GalleryItem({
    required this.id,
    required this.resource,
    this.isSVG = false,
  });

  final String id;
  final String resource;
  final bool isSVG;
}

class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail(
      {super.key, required this.galleryItem, required this.onTap});

  final GalleryItem galleryItem;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryItem.id,
          child: Image.asset(
            galleryItem.resource,
            height: 80.0,
          ),
        ),
      ),
    );
  }
}

List<GalleryItem> galleryItems = <GalleryItem>[
  GalleryItem(id: 'Item1', resource: 'assets/gallery1.jpg'),
  GalleryItem(id: 'Item2', resource: 'assets/gallery2.jpg'),
  GalleryItem(id: 'Item3', resource: 'assets/gallery3.jpg'),
  GalleryItem(id: 'Item4', resource: 'assets/firefox.svg', isSVG: true),
];

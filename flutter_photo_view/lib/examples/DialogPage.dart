import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:photo_view/photo_view.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  void openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoView(
            tightMode: true,
            imageProvider: const AssetImage('assets/large-image.jpg'),
            heroAttributes: const PhotoViewHeroAttributes(tag: 'someTag'),
          ),
        );
      });

  void openBottomSheet(BuildContext context) => showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const ContinuousRectangleBorder(),
      builder: (BuildContext context) {
        return PhotoViewGestureDetectorScope(
          axis: Axis.vertical,
          child: PhotoView(
            backgroundDecoration:
                BoxDecoration(color: Colors.black.withAlpha(240)),
            imageProvider: const AssetImage('assets/large-image.jpg'),
            heroAttributes: const PhotoViewHeroAttributes(tag: 'someTag'),
          ),
        );
      });

  void openBottomSheetModal(BuildContext context) => showBottomSheet(
      context: context,
      shape: const ContinuousRectangleBorder(),
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 250,
            child: PhotoViewGestureDetectorScope(
              axis: Axis.vertical,
              child: PhotoView(
                tightMode: true,
                imageProvider: const AssetImage('assets/large-image.jpg'),
                heroAttributes: const PhotoViewHeroAttributes(tag: 'someTag'),
              ),
            ),
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
        title: 'Dialog integration',
        child: Builder(
          builder: (context) => Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.red),
              ),
              ElevatedButton(
                onPressed: () => openDialog(context),
                child: const Text('Dialog'),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () => openBottomSheet(context),
                child: const Text('Bottom Sheet'),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () => openBottomSheetModal(context),
                child: const Text('Bottom Sheet tight mode'),
              )
            ],
          ),
        ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:photo_view/photo_view.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

const double min = pi * -2;
const double max = pi * 2;

const double minScale = 0.03;
const double devScale = 0.1;
const double maxScale = 0.6;

class _ControllerPageState extends State<ControllerPage> {
  late PhotoViewControllerBase controller;
  late PhotoViewScaleStateController scaleStateController;

  int calls = 0;

  @override
  void initState() {
    controller = PhotoViewController(initialScale: devScale)
      ..outputStateStream.listen(onController);

    scaleStateController = PhotoViewScaleStateController()
      ..outputScaleStateStream.listen(onScaleState);

    super.initState();
  }

  void onScaleState(PhotoViewScaleState scaleState) {
    print(scaleState);
  }

  void onController(PhotoViewControllerValue value) {
    setState(() {
      calls += 1;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scaleStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBarLayout(
      title: 'Controller',
      child: ClipRect(
        child: Stack(
          children: [
            Positioned.fill(
              child: PhotoView(
                imageProvider: const AssetImage('assets/large-image.jpg'),
                controller: controller,
                scaleStateController: scaleStateController,
                enableRotation: true,
                initialScale: minScale * 1.5,
                minScale: minScale,
                maxScale: maxScale,
              ),
            ),
            Positioned(
              bottom: 0,
              height: 290,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: StreamBuilder(
                  stream: controller.outputStateStream,
                  initialData: controller.value,
                  builder: _streamBuild,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _streamBuild(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError || !snapshot.hasData) {
      return Container();
    }
    final PhotoViewControllerValue value = snapshot.data;

    return Column(
      children: [
        Text(
          "Rotation ${value.rotation}",
          style: const TextStyle(color: Colors.white),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.orange, thumbColor: Colors.orange),
          child: Slider(
            value: value.rotation.clamp(min, max),
            min: min,
            max: max,
            onChanged: (double newRotation) {
              controller.rotation = newRotation;
            },
          ),
        ),
        Text(
          "Scale ${value.scale}",
          style: const TextStyle(color: Colors.white),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.orange, thumbColor: Colors.orange),
          child: Slider(
            value: value.scale!.clamp(min, max),
            min: min,
            max: max,
            onChanged: (double newSale) {
              controller.scale = newSale;
            },
          ),
        ),
        Text(
          "Position ${value.position.dx}",
          style: const TextStyle(color: Colors.white),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.orange, thumbColor: Colors.orange),
          child: Slider(
            value: value.position.dx,
            min: -1000.0,
            max: 1000.0,
            onChanged: (double newPosition) {
              controller.position = Offset(newPosition, controller.position.dy);
            },
          ),
        ),
        Text(
          "Sale State ${scaleStateController.scaleState}",
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

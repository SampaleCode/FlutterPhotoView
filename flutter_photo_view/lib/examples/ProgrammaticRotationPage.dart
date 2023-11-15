import 'package:flutter/material.dart';
import 'package:flutter_photo_view/common/MyAppBar.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:math' as math;

class ProgrammaticRotationPage extends StatefulWidget {
  const ProgrammaticRotationPage({super.key});

  @override
  State<ProgrammaticRotationPage> createState() =>
      _ProgrammaticRotationPageState();
}

class _ProgrammaticRotationPageState extends State<ProgrammaticRotationPage> {
  final PhotoViewController _controller = PhotoViewController();
  var _quarterTurns = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyAppBar(title: 'Programmatic Rotation'),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text(
                    'Example without manual rotation, click the button to rotate',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 300.0,
                  child: ClipRect(
                    child: PhotoView(
                      controller: _controller,
                      imageProvider: const AssetImage('assets/large-image.jpg'),
                      maxScale: PhotoViewComputedScale.covered,
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                      enableRotation: false,
                    ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rotateRight90Degrees,
        child: const Icon(Icons.rotate_right),
      ),
    );
  }

  void _rotateRight90Degrees() {
    _quarterTurns = _quarterTurns == 3 ? 0 : _quarterTurns + 1;
    _controller.rotation = math.pi / 2 * _quarterTurns;
  }
}

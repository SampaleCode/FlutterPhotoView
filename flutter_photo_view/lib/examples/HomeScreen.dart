import 'package:flutter/material.dart';

import '../common/MyAppBar.dart';
import 'CommonUsecasePage.dart';
import 'ControllerPage.dart';
import 'CustomChildPage.dart';
import 'DialogPage.dart';
import 'GalleryPage.dart';
import 'GestureRotationPage.dart';
import 'HeroAnimationPage.dart';
import 'InlinePage.dart';
import 'NetworkImagesPage.dart';
import 'ProgrammaticRotationPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MyAppBar(title: 'Flutter Photo View'),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'Photo View Common useCase below',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildItem(context,
                  text: 'Common Use Case Page',
                  page: const CommonUseCasePage()),
              _buildItem(context,
                  text: 'Gallery Page', page: GalleryPage()),
              _buildItem(context,
                  text: 'Hero animation Page', page: const HeroAnimationPage()),
              _buildItem(context,
                  text: 'Network Images Page', page: const NetworkImagesPage()),
              _buildItem(context,
                  text: 'Controller Page', page: const ControllerPage()),
              _buildItem(context,
                  text: 'Part of the screen Page', page: const InlinePage()),
              _buildItem(context,
                  text: 'Custom Child Page', page: const CustomChildPage()),
              _buildItem(context,
                  text: 'Integrated to Dialogs Page', page: const DialogPage()),
              _buildItem(context,
                  text: 'Rotation Gesture Page',
                  page: const GestureRotationPage()),
              _buildItem(context,
                  text: 'Programmatic Rotation Page',
                  page: const ProgrammaticRotationPage())
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildItem(context, {required String text, required Widget page}) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      ),
    );
  }
}

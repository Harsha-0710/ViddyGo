import 'package:flutter/material.dart';
import 'package:stream_application_1/login_animation.dart';

void main() {
  runApp(VideoStreamApp());
}

class VideoStreamApp extends StatelessWidget {
  const VideoStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginAnimation(),
    );
  }
}

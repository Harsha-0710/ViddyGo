// lib/data/video_data.dart
import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFF2C2C2C); // Dark background
const Color kAppBarColor = Color(0xFF444444); // AppBar
const Color kAccentColor = Color(0xFFFFC107); // Amber for highlights

final List<Map<String, String>> videoData = [
  {
    'path': 'assets/videos/sample-1.mp4',
    'thumbnail': 'assets/thumbnails/thumbnail-1.png',
    'description': 'This is the description for video 1.',
  },
  {
    'path': 'assets/videos/sample-2.mp4',
    'thumbnail': 'assets/thumbnails/thumbnail-2.png',
    'description': 'This is the description for video 2.',
  },
  {
    'path': 'assets/videos/sample-3.mp4',
    'thumbnail': 'assets/thumbnails/thumbnail-3.png',
    'description': 'This is the description for video 3.',
  },
  {
    'path': 'assets/videos/sample-4.mp4',
    'thumbnail': 'assets/thumbnails/thumbnail-4.png',
    'description': 'This is the description for video 4.',
  },
];

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_application_1/progress_screen.dart';
import 'package:stream_application_1/video_details.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

// Make sure you have imported FullScreenLoader or it’s in the same file.

class DetailPage extends StatefulWidget {
  final String videoPath;
  final String description;

  const DetailPage({
    super.key,
    required this.videoPath,
    required this.description,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  bool isLoading = true; // Track loading state

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath);

    // Listen for buffering and playing states
    _videoPlayerController.addListener(() {
      final bool buffering = _videoPlayerController.value.isBuffering;
      if (buffering != isLoading) {
        setState(() {
          isLoading = buffering;
        });
      }
    });

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true,
      allowMuting: true,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
    );

    // Once initialized, stop loading
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null ||
        !_videoPlayerController.value.isInitialized) {
      // Show full screen loader while initializing
      return const Scaffold(body: FullScreenLoader());
    }

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: AppBar(
              title: const Text('Video Detail'),
              backgroundColor: kAppBarColor,
              foregroundColor: kAccentColor,
            ),
            body: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_videoPlayerController.value.isPlaying) {
                      _videoPlayerController.pause();
                    } else {
                      _videoPlayerController.play();
                    }
                    setState(() {});
                  },
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Show loader overlay when buffering
          if (isLoading) const FullScreenLoader(),
        ],
      ),
    );
  }
}

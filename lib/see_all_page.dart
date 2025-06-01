import 'package:flutter/material.dart';
import 'package:stream_application_1/detail_page.dart';
import 'package:stream_application_1/video_details.dart';

class SeeAllPage extends StatelessWidget {
  

  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> allVideos = List.generate(
      20,
      (index) => videoData[index % videoData.length],
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('All Videos'),
        backgroundColor: kAppBarColor,
        foregroundColor: kAccentColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 16 / 9,
        ),
        itemCount: allVideos.length,
        itemBuilder: (context, index) {
          final video = allVideos[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => DetailPage(
                        videoPath: video['path']!,
                        description: video['description']!,
                      ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(video['thumbnail']!, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}

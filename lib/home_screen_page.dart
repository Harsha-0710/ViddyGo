import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stream_application_1/see_all_page.dart';
import 'package:stream_application_1/video_details.dart';
import 'detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categoryNames = [
    'Featured',
    'Trending',
    'New Releases',
    'Recommended',
    'Classics',
  ];

  late List<List<Map<String, String>>> shuffledVideosPerCategory;
  late List<int> currentVideoIndexList;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final random = Random();
    shuffledVideosPerCategory =
        categoryNames.map((_) {
          List<Map<String, String>> shuffled = List.from(videoData);
          shuffled.shuffle(random);
          return shuffled;
        }).toList();
    currentVideoIndexList = List<int>.filled(categoryNames.length, 0);
  }

  Future<void> _onPageChanged(int categoryIndex, int newIndex) async {
    setState(() {
      isLoading = true;
    });

    // Simulate loading/buffering delay
    await Future.delayed(const Duration(milliseconds: 100));

    setState(() {
      currentVideoIndexList[categoryIndex] = newIndex;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            title: const Text('ViddyGo'),
            backgroundColor: kAppBarColor,
            foregroundColor: kAccentColor,
          ),
          body: ListView.builder(
            itemCount: categoryNames.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, categoryIndex) {
              final categoryName = categoryNames[categoryIndex];
              final currentIndex = currentVideoIndexList[categoryIndex];
              final videos = shuffledVideosPerCategory[categoryIndex];

              final PageController pageController = PageController(
                viewportFraction: 0.8,
                initialPage: currentIndex,
              );

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categoryName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SeeAllPage()),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            icon: const Text(
                              'See All',
                              style: TextStyle(fontSize: 16),
                            ),
                            label: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: screenHeight * 0.35,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: videos.length,
                        onPageChanged:
                            (index) => _onPageChanged(categoryIndex, index),
                        itemBuilder: (context, videoIndex) {
                          final scale = currentIndex == videoIndex ? 1.0 : 0.9;
                          final video = videos[videoIndex];

                          return AnimatedScale(
                            scale: scale,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                            child: GestureDetector(
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
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    video['thumbnail']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        videos[currentIndex]['description']!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

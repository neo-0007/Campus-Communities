import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/image_strings.dart';
import 'package:flutter_app/features/home/presentation/widgets/poster_image.dart';
import 'package:flutter_app/features/home/presentation/widgets/services_boxes.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final List<String> banners = [
    ImageStrings.bannerDummy,
    ImageStrings.bannerDummy,
    ImageStrings.bannerDummy,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> serviceImages = [
    ImageStrings.exploreService,
    ImageStrings.complaintsService,
    ImageStrings.rentService,
    ImageStrings.lobbyService,
    ImageStrings.peopleService,
    ImageStrings.tradeService
  ];

  final List<bool> isImageSvg=[false,true,true,true,true,true];
  final List<String> serviceTitles = [
    'explore',
    'complaints',
    'rent',
    'lobby',
    'people',
    'trade',
  ];

  final List<Color> serviceColors = [
    Color(0xFF0300FF),
    Color(0xFFBCBCBC),
    Color(0xFFFCDD10),
    Color(0xFFF00101),
    Color(0xFF8CFF00),
    Color(0xFFFFA500),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          // Wrap the entire content in SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/CC_logo2_transp.png',
                      width: 200,
                      height: 48,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar_placeholder.png'),
                        minRadius: 15,
                        maxRadius: 23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: widget.banners
                            .map((item) => PosterImage(imagePath: item))
                            .toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.banners.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => setState(() {
                              _currentIndex = entry.key;
                            }),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 7.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == entry.key
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Services',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  height: 400,
                  child: GridView.builder(
                    itemCount: 6,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return ServicesBoxes(
                          boxColor: serviceColors[index],
                          boxImage: serviceImages[index],
                          boxTitle: serviceTitles[index],
                          isSvg: isImageSvg[index],
                          onTap: () {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
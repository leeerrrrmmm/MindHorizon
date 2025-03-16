import 'package:flutter/material.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/music/first_detail_music_screen.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('asset/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('asset/img/rvec.png')),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: musiscCategory.length,
                itemBuilder: (context, categoryIndex) {
                  final category = musiscCategory[categoryIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color(0xfffea386),
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: category.categoryFields.length,
                        itemBuilder: (context, index) {
                          final item = category.categoryFields[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(
                                    milliseconds: 300,
                                  ),
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => DetailScreen(
                                        title: item.title,
                                        description: item.description,
                                        imagePath: item.imagePath,
                                        sounds: item.sounds,
                                        indexEl: index,
                                      ),
                                  transitionsBuilder: (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(0.0, 1.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },

                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              width: 397,
                              height: 397,
                              decoration: BoxDecoration(
                                color: Color(0xfffea386),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    item.imagePath,
                                    fit: BoxFit.cover,
                                    height: 316,
                                    width: 320,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xfffbc9aa),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff455a64),
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            item.description,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff455a64),
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

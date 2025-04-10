import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          Positioned(left: 0, child: Image.asset('assets/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('assets/img/rvec.png')),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: musiscCategory.length,
                itemBuilder: (context, categoryIndex) {
                  final category = musiscCategory[categoryIndex];
                  return Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.title,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height < 896
                                    ? 30.sp
                                    /// Тест для СЕ
                                    : MediaQuery.of(context).size.height > 896
                                    ? 30
                                        .sp // 16 pro max
                                    : 30.sp, // 11 iphone
                            fontWeight: FontWeight.w500,
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
                                        ) => FirstDetailMusicScreen(
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
                                width: 397.w,
                                height:
                                    MediaQuery.of(context).size.width < 430
                                        ? 330.h
                                        : 290.h,
                                decoration: BoxDecoration(
                                  color: Color(0xfffea386),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// IMG
                                    Image.asset(
                                      item.imagePath,
                                      fit: BoxFit.cover,
                                      height:
                                          MediaQuery.of(context).size.height <
                                                  896
                                              ? 230.h
                                              /// Тест для СЕ
                                              : MediaQuery.of(
                                                    context,
                                                  ).size.height >
                                                  896
                                              ? 210
                                                  .h // 16 pro max
                                              : 250.h, // 11 iphone
                                    ),

                                    /// BOT CONTAINER
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height <
                                                  896
                                              ? 90.h
                                              /// Тест для СЕ
                                              : MediaQuery.of(
                                                    context,
                                                  ).size.height >
                                                  896
                                              ? 70
                                                  .h // 16 pro max
                                              : 80.h, // 11 iphone,
                                      decoration: BoxDecoration(
                                        color: Color(0xfffbc9aa),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10.0,
                                          top: 5.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title,
                                              style: TextStyle(
                                                fontSize:
                                                    MediaQuery.of(
                                                              context,
                                                            ).size.height <
                                                            896
                                                        ? 20.sp
                                                        /// Тест для СЕ
                                                        : MediaQuery.of(
                                                              context,
                                                            ).size.height >
                                                            896
                                                        ? 20
                                                            .sp // 16 pro max
                                                        : 20.sp, // 11 iphone
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff455a64),
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            Text(
                                              item.description,
                                              style: TextStyle(
                                                fontSize:
                                                    MediaQuery.of(
                                                              context,
                                                            ).size.height <
                                                            896
                                                        ? 12.sp
                                                        /// Тест для СЕ
                                                        : MediaQuery.of(
                                                              context,
                                                            ).size.height >
                                                            896
                                                        ? 12
                                                            .sp // 16 pro max
                                                        : 13.sp, // 11 iphone
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
                    ),
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

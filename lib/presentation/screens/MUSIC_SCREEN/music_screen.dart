import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/music/first_detail_music_screen.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('assets/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('assets/img/rvec.png')),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ), // Уменьшен горизонтальный padding
              child: ListView.builder(
                itemCount: musiscCategory.length,
                itemBuilder: (context, categoryIndex) {
                  final category = musiscCategory[categoryIndex];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 4.w,
                      bottom: 20.h,
                    ), // Добавлены отступы между элементами
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.title,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: const Color(0xfffea386),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ), // Отступ между заголовком и списком
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: category.categoryFields.length,
                          itemBuilder: (context, index) {
                            final item = category.categoryFields[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(
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
                                          begin: const Offset(0.0, 1.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                width: 397.w,
                                height: 330.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xfffea386),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      item.imagePath,
                                      fit: BoxFit.cover,
                                      height: 250.h,
                                    ),
                                    Container(
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfffbc9aa),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.r),
                                          bottomRight: Radius.circular(10.r),
                                        ),
                                      ),
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 10.w,
                                          top: 5.h,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title,
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff455a64),
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                            Text(
                                              item.description,
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: const Color(0xff455a64),
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

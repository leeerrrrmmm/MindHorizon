import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/home/detail_home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('assets/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('assets/img/rvec.png')),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(
              itemCount: myCourseCategory.length,
              itemBuilder: (context, index) {
                final myCategory = myCourseCategory[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: BuildText(
                        text: myCategory.title,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color(0xfffea386),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 175,
                      child: ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: myCategory.categoryFields.length,
                        itemBuilder: (context, secIndex) {
                          final secondItem =
                              myCourseCategory[index].categoryFields[secIndex];

                          return secondItem.title == ''
                              ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                // ASMR DETAIL SCREEN
                                child: GestureDetector(
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder:
                                              (context) => DetailHomeScreen(
                                                index: index,
                                                title: myCategory.title,
                                                secondIndex: secIndex,
                                                secondeItems: secondItem,
                                                imagePath: secondItem.imagePath,
                                                colors: secondItem.colors,
                                              ),
                                        ),
                                      ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(secondItem.imagePath),
                                  ),
                                ),
                              )
                              // My Course
                              : GestureDetector(
                                onTap:
                                    () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder:
                                            (context) => DetailHomeScreen(
                                              index: index,
                                              title: myCategory.title,
                                              secondIndex: secIndex,
                                              secondeItems: secondItem,
                                              colors: secondItem.colors,
                                            ),
                                      ),
                                    ),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  width:
                                      myCategory.categoryFields.length > 1
                                          ? 175
                                          : 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: secondItem.colors?[0],
                                  ),
                                  child:
                                      myCategory.categoryFields.length > 1
                                          ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                secondItem.imagePath,
                                                scale: 1,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                  color: secondItem.colors?[1],
                                                ),
                                                width: double.infinity,
                                                height: 38,
                                                child: Center(
                                                  child: BuildText(
                                                    text: secondItem.title,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        secIndex == 0
                                                            ? Colors.black
                                                            : secIndex == 1
                                                            ? Colors.white
                                                            : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                          : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                secondItem.imagePath,
                                                width: 130,
                                                height: 130,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 55.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    BuildText(
                                                      text: secondItem.title,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    BuildText(
                                                      text:
                                                          secondItem
                                                              .description,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                ),
                              );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

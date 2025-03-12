import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('asset/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('asset/img/rvec.png')),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: sleepCategory.length,
                itemBuilder: (context, index) {
                  final category = sleepCategory[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      BuildText(
                        text: category.title,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Color(0xfffea386),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: index == 0 ? 175 : 287,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.categoryFields.length,
                          itemBuilder: (context, categoryIndex) {
                            final item = category.categoryFields[categoryIndex];
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              width: index == 0 ? 175 : 287,
                              decoration: BoxDecoration(
                                color:
                                    category.categoryFields[categoryIndex].id ==
                                            0
                                        ? Color(0xffa3fdbd)
                                        : category.categoryFields.length > 2
                                        ? category
                                                    .categoryFields[categoryIndex]
                                                    .id ==
                                                1
                                            ? Color(0xfffea386)
                                            : Color(0xffead2ef)
                                        : Color(0xffead2ef),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(item.imagePath),
                                  Container(
                                    height:
                                        category.categoryFields[index].id == 0
                                            ? 36
                                            : 91,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          category
                                                      .categoryFields[categoryIndex]
                                                      .id ==
                                                  0
                                              ? Color(0xff92e3a9)
                                              : category.categoryFields.length >
                                                  2
                                              ? category
                                                          .categoryFields[categoryIndex]
                                                          .id ==
                                                      1
                                                  ? Color(0xffff725e)
                                                  : Color(0xff9f59ab)
                                              : Color(0xff9f59ab),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 3,
                                        left: 12.0,
                                        bottom: 3,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            style: TextStyle(
                                              color:
                                                  category
                                                              .categoryFields[categoryIndex]
                                                              .id ==
                                                          0
                                                      ? Colors.black
                                                      : category
                                                              .categoryFields
                                                              .length >
                                                          2
                                                      ? category
                                                                  .categoryFields[categoryIndex]
                                                                  .id ==
                                                              1
                                                          ? Colors.white
                                                          : Colors.black
                                                      : Colors.black,
                                              fontSize:
                                                  category
                                                              .categoryFields[index]
                                                              .id ==
                                                          0
                                                      ? 20
                                                      : 25,
                                              fontFamily: 'Poppins',
                                              fontWeight:
                                                  category
                                                              .categoryFields[index]
                                                              .id ==
                                                          0
                                                      ? FontWeight.w300
                                                      : FontWeight.w600,
                                            ),
                                          ),
                                          category
                                                      .categoryFields[index]
                                                      .description !=
                                                  ''
                                              ? Text(
                                                item.description,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}

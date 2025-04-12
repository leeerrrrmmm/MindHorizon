import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/meditation_detail_screen.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('assets/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('assets/img/rvec.png')),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 15),
            child: BlocBuilder<MeditationBloc, MeditationState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: sleepCategory.length,
                  itemBuilder: (context, index) {
                    final category = sleepCategory[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildText(
                          text: category.title,
                          fontSize:
                              MediaQuery.of(context).size.height < 896
                                  ? 30.sp
                                  /// Тест для СЕ
                                  : MediaQuery.of(context).size.height > 896
                                  ? 30
                                      .sp // 16 pro max
                                  : 30.sp, // 11 iphone
                          fontWeight: FontWeight.w500,
                          color: Color(0xfffea386),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height < 896
                                  ? index == 0
                                      ? 205.h
                                      : 245.h
                                  /// Тест для СЕ
                                  : MediaQuery.of(context).size.height > 896
                                  ? index == 0
                                      ? 175.h
                                      : 260
                                          .h
                                          .sp // 16 pro max
                                  : index == 0
                                  ? 175.h
                                  : 250.h, // 11 iphone,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.categoryFields.length,
                            itemBuilder: (context, categoryIndex) {
                              final item =
                                  category.categoryFields[categoryIndex];
                              int currentStep =
                                  state.steps[item.id] ??
                                  (item.curStepListened ?? 0);
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => BlocProvider.value(
                                            value:
                                                context.read<MeditationBloc>(),
                                            child: MeditationDetailScreen(
                                              curStepMusic: '',
                                              curListenedEl: currentStep,
                                              secItemId: item.id,
                                              stepCounter: item.steps!.length,
                                              steps: item.steps,
                                              colors: item.colors,
                                            ),
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width:
                                      MediaQuery.of(context).size.height < 896
                                          ? index == 0
                                              ? 190.w
                                              : 267.w
                                          /// Тест для СЕ
                                          : MediaQuery.of(context).size.height >
                                              896
                                          ? index == 0
                                              ? 175.w
                                              : 287.w
                                          // 16 pro max
                                          : index == 0
                                          ? 175.w
                                          : 287.w, // 11 iphone
                                  //  index == 0 ? 175 : 287,
                                  decoration: BoxDecoration(
                                    color: item.colors?[0],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        categoryIndex == 0
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.center,
                                    children: [
                                      // PHOTO
                                      Image.asset(
                                        item.imagePath,
                                        scale:
                                            MediaQuery.of(context).size.height <
                                                    896
                                                ? index == 0
                                                    ? categoryIndex == 0
                                                        ? 1.1
                                                        : 1
                                                    : 1.6
                                                /// Тест для СЕ
                                                : MediaQuery.of(
                                                      context,
                                                    ).size.height >
                                                    896
                                                ? index == 0
                                                    ? categoryIndex == 0
                                                        ? 0.95
                                                        : 0.9
                                                    : 0.94 // 16 pro max
                                                : index == 0
                                                ? categoryIndex == 0
                                                    ? 1.1
                                                    : 1
                                                : 1.24, // 11 iphone
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height <
                                                    896
                                                ? category
                                                            .categoryFields[index]
                                                            .id ==
                                                        0
                                                    ? 30
                                                    : 65
                                                /// Тест для СЕ
                                                : MediaQuery.of(
                                                      context,
                                                    ).size.height >
                                                    896
                                                ? category
                                                            .categoryFields[index]
                                                            .id ==
                                                        0
                                                    ? 35
                                                    : 75
                                                        .h // 16 pro max
                                                : category
                                                        .categoryFields[index]
                                                        .id ==
                                                    0
                                                ? 40.h
                                                : 90.h, // 11 iphone
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: item.colors?[1],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                            left: 12,

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
                                                      MediaQuery.of(
                                                                context,
                                                              ).size.height <
                                                              896
                                                          ? category
                                                                      .categoryFields[index]
                                                                      .id ==
                                                                  0
                                                              ? 15.sp
                                                              : 18.sp
                                                          /// Тест для СЕ
                                                          : MediaQuery.of(
                                                                context,
                                                              ).size.height >
                                                              896
                                                          ? category
                                                                      .categoryFields[index]
                                                                      .id ==
                                                                  0
                                                              ? 16.sp
                                                              : 18
                                                                  .sp // 16 pro max
                                                          : category
                                                                  .categoryFields[index]
                                                                  .id ==
                                                              0
                                                          ? 16.sp
                                                          : 20.sp, // 11 iphone

                                                  fontFamily: 'Poppins',
                                                  fontWeight:
                                                      category
                                                                  .categoryFields[index]
                                                                  .id ==
                                                              0
                                                          ? FontWeight.w400
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
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height <
                                                                  896
                                                              ? 10.sp
                                                              /// Тест для СЕ
                                                              : MediaQuery.of(
                                                                        context,
                                                                      )
                                                                      .size
                                                                      .height >
                                                                  896
                                                              ? 12
                                                                  .sp // 16 pro max
                                                              : 9.sp, // 11 iphone
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  )
                                                  : SizedBox(),
                                              category
                                                          .categoryFields[index]
                                                          .description !=
                                                      ''
                                                  ? BlocBuilder<
                                                    MeditationBloc,
                                                    MeditationState
                                                  >(
                                                    builder: (context, state) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              right: 10.0,
                                                            ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(
                                                              '${item.steps!.length} steps',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    MediaQuery.of(
                                                                              context,
                                                                            ).size.height <
                                                                            896
                                                                        ? 10.sp
                                                                        /// Тест для СЕ
                                                                        : MediaQuery.of(
                                                                              context,
                                                                            ).size.height >
                                                                            896
                                                                        ? 10
                                                                            .sp // 16 pro max
                                                                        : 10.sp, // 11 iphone
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  double
                                                                      .infinity,
                                                              height: 8,
                                                              decoration:
                                                                  BoxDecoration(
                                                                    color: Color(
                                                                      0xffffffff,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          12,
                                                                        ),
                                                                  ),
                                                              child: Stack(
                                                                children: [
                                                                  AnimatedContainer(
                                                                    duration: Duration(
                                                                      milliseconds:
                                                                          300,
                                                                    ),
                                                                    width:
                                                                        ((state.steps[item.id] ??
                                                                                0) /
                                                                            item.steps!.length) *
                                                                        290,
                                                                    height: 8,
                                                                    decoration: BoxDecoration(
                                                                      color: Color(
                                                                        0xff263238,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  )
                                                  : const SizedBox(),
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
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/meditation_detail_screen.dart';
import 'package:mind_horizon/testt/a.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(left: 0, child: Image.asset('assets/img/lvec.png')),
            Positioned(right: 0, child: Image.asset('assets/img/rvec.png')),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<MeditationBloc, MeditationState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: meditationCategory.length,
                          itemBuilder: (context, index) {
                            final item = meditationCategory[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                bottom: 20.0,
                                top: 20.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xfffea386),
                                        fontSize:
                                            MediaQuery.of(context).size.height <
                                                    896
                                                ? 30.h
                                                /// Тест для СЕ
                                                : MediaQuery.of(
                                                      context,
                                                    ).size.height >
                                                    896
                                                ? 30
                                                    .h // 16 pro max
                                                : 30.h, // 11 iphone
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height < 896
                                            ? 312.h
                                            /// Тест для СЕ
                                            : MediaQuery.of(
                                                  context,
                                                ).size.height >
                                                896
                                            ? 280
                                                .h // 16 pro max
                                            : 280.h, // 11 iphone
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: item.categoryFields.length,
                                      itemBuilder: (context, secIndex) {
                                        final secItem =
                                            item.categoryFields[secIndex];
                                        int currentStep =
                                            state.steps[secItem.id] ??
                                            (secItem.curStepListened ?? 0);
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder:
                                                    (
                                                      context,
                                                    ) => BlocProvider.value(
                                                      value:
                                                          context
                                                              .read<
                                                                MeditationBloc
                                                              >(), // Используем тот же экземпляр BLoC
                                                      child: MeditationDetailScreen(
                                                        curListenedEl:
                                                            currentStep,
                                                        secItemId: secItem.id,
                                                        stepCounter:
                                                            secItem
                                                                .steps!
                                                                .length,
                                                        steps: secItem.steps,
                                                        colors: secItem.colors,
                                                        curStepMusic:
                                                            secItem
                                                                .steps![currentStep]
                                                                .stepAsset,
                                                      ),
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(10.0),
                                            width:
                                                MediaQuery.of(
                                                          context,
                                                        ).size.height <
                                                        690
                                                    ? 240.w
                                                    : 260.w,
                                            decoration: BoxDecoration(
                                              color: secItem.colors![0],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.asset(
                                                  secItem.imagePath,
                                                  height:
                                                      MediaQuery.of(
                                                                context,
                                                              ).size.height <
                                                              690
                                                          ? 150
                                                          : 160,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.of(
                                                                context,
                                                              ).size.height <
                                                              896
                                                          ? 94.h
                                                          /// Тест для СЕ
                                                          : MediaQuery.of(
                                                                context,
                                                              ).size.height >
                                                              896
                                                          ? 93
                                                              .h // 16 pro max
                                                          : 93.h, // 11 iphone
                                                  decoration: BoxDecoration(
                                                    color: secItem.colors![1],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          bottomRight:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 5.0,
                                                          left: 11.0,
                                                        ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // TITLE
                                                        Text(
                                                          secItem.title,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize:
                                                                MediaQuery.of(
                                                                          context,
                                                                        ).size.height <
                                                                        896
                                                                    ? 16.sp
                                                                    /// Тест для СЕ
                                                                    : MediaQuery.of(
                                                                          context,
                                                                        ).size.height >
                                                                        896
                                                                    ? 20
                                                                        .sp // 16 pro max
                                                                    : 16.sp, // 11 iphone
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        // DESCRIPTION
                                                        Flexible(
                                                          child: Text(
                                                            secItem.description,
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
                                                                      ? 12
                                                                          .sp // 16 pro max
                                                                      : 9.sp, // 11 iphone
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            '${secItem.steps!.length} steps',
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                right: 10.0,
                                                              ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                                  color: Color(
                                                                    0xfffcd1af,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        12,
                                                                      ),
                                                                ),
                                                            child: Stack(
                                                              children: [
                                                                AnimatedContainer(
                                                                  duration:
                                                                      Duration(
                                                                        milliseconds:
                                                                            300,
                                                                      ),
                                                                  width:
                                                                      ((state.steps[secItem.id] ??
                                                                              0) /
                                                                          secItem
                                                                              .steps!
                                                                              .length) *
                                                                      290,
                                                                  height: 8,
                                                                  decoration: BoxDecoration(
                                                                    color: Color(
                                                                      0xfff19584,
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
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}

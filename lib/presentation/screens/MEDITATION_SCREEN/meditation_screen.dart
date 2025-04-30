import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/meditation_detail_screen.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8ecd6),
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
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: meditationCategory.length,
                          itemBuilder: (context, index) {
                            final item = meditationCategory[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: 15.w,
                                bottom: 20.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xfffea386),
                                        fontSize: 26.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 280.h,
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
                                              MaterialPageRoute(
                                                builder:
                                                    (
                                                      context,
                                                    ) => BlocProvider.value(
                                                      value:
                                                          context
                                                              .read<
                                                                MeditationBloc
                                                              >(),
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
                                                                .steps![secIndex]
                                                                .stepAsset,
                                                      ),
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10.w),
                                            width: 260.w,
                                            decoration: BoxDecoration(
                                              color: secItem.colors![0],
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  index == 0 && secIndex == 0
                                                      ? CrossAxisAlignment.end
                                                      : CrossAxisAlignment
                                                          .center,
                                              children: [
                                                Image.asset(
                                                  secItem.imagePath,
                                                  height: 160.h,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 93.h,
                                                  decoration: BoxDecoration(
                                                    color: secItem.colors![1],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                10.r,
                                                              ),
                                                          bottomRight:
                                                              Radius.circular(
                                                                10.r,
                                                              ),
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 5.h,
                                                      left: 11.w,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          secItem.title,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            secItem.description,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 10.h),
                                                        Flexible(
                                                          child: Text(
                                                            '${secItem.steps!.length} steps',
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
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
                                                              EdgeInsets.only(
                                                                right: 10.w,
                                                              ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 8.h,
                                                            decoration:
                                                                BoxDecoration(
                                                                  color:
                                                                      Colors
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        12.r,
                                                                      ),
                                                                ),
                                                            child: Stack(
                                                              children: [
                                                                AnimatedContainer(
                                                                  duration:
                                                                      const Duration(
                                                                        milliseconds:
                                                                            300,
                                                                      ),
                                                                  width:
                                                                      (currentStep /
                                                                          secItem
                                                                              .steps!
                                                                              .length) *
                                                                      290.w,
                                                                  height: 8.h,
                                                                  decoration: BoxDecoration(
                                                                    color: const Color(
                                                                      0xff263238,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          12.r,
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

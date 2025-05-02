import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/meditation_detail_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/widgets/long_meditation_screen.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MeditationBloc>().add(LoadStepsFromStorage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('assets/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('assets/img/rvec.png')),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<MeditationBloc, MeditationState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
                return ListView.builder(
                  itemCount: sleepCategory.length,
                  itemBuilder: (context, index) {
                    final category = sleepCategory[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildText(
                          text: category.title,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xfffea386),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: index == 0 ? 200.h : 300.h,
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
                                  if (category.title == 'Meditation') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => BlocProvider.value(
                                              value:
                                                  context
                                                      .read<MeditationBloc>(),
                                              child: MeditationDetailScreen(
                                                curListenedEl: currentStep,
                                                secItemId: item.id,
                                                stepCounter: item.steps!.length,
                                                steps: item.steps,
                                                colors: item.colors,
                                                curStepMusic:
                                                    item
                                                        .steps![categoryIndex]
                                                        .stepAsset,
                                              ),
                                            ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => LongMeditationScreen(
                                              colors: item.colors,
                                              longStepAsset: item.longStepAsset,
                                              title: item.title,
                                            ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  width: index == 0 ? 190.w : 280.w,
                                  decoration: BoxDecoration(
                                    color: item.colors?[0],
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(item.imagePath),
                                      Container(
                                        height: index == 0 ? 38.h : 90.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: item.colors?[1],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12.r),
                                            bottomRight: Radius.circular(12.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                            vertical: 4.h,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BuildText(
                                                text: item.title,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    categoryIndex == 0
                                                        ? Colors.black
                                                        : categoryIndex == 1
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                              if (item.description.isNotEmpty)
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 4.h,
                                                  ),
                                                  child: Text(
                                                    item.description,
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              if (item.description.isNotEmpty)
                                                BlocBuilder<
                                                  MeditationBloc,
                                                  MeditationState
                                                >(
                                                  builder: (context, state) {
                                                    final progress =
                                                        (state.steps[item.id] ??
                                                            0) /
                                                        item.steps!.length;
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 6.h,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${item.steps!.length} steps',
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 8.h,
                                                            width:
                                                                double.infinity,
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
                                                                      Duration(
                                                                        milliseconds:
                                                                            300,
                                                                      ),
                                                                  width:
                                                                      290.w *
                                                                      progress,
                                                                  decoration: BoxDecoration(
                                                                    color: Color(
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
                                                        ],
                                                      ),
                                                    );
                                                  },
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
                        SizedBox(height: 20.h),
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

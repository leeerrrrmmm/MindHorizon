import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/meditation_detail_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/sleep/first_detail_sleep_screen.dart';
import 'package:mind_horizon/testt/a.dart';

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
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: BlocBuilder<MeditationBloc, MeditationState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: sleepCategory.length,
                  itemBuilder: (context, index) {
                    final category = sleepCategory[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        BuildText(
                          text: category.title,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Color(0xfffea386),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: index == 0 ? 155.w : 260.w,
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
                                  index == 0
                                      ? Navigator.push(
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
                                              ) => FirstDetailSleepScreen(
                                                title: item.title,
                                                description: item.description,
                                                largestImagepath:
                                                    item.largestImagepath ?? '',
                                                sounds: item.sounds,
                                                indexEl: index,
                                                itemColors: item.colors,
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
                                      )
                                      : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => BlocProvider.value(
                                                value:
                                                    context
                                                        .read<MeditationBloc>(),
                                                child: MeditationDetailScreen(
                                                  curStepMusic: '',
                                                  curListenedEl: currentStep,
                                                  secItemId: item.id,
                                                  stepCounter:
                                                      item.steps!.length,
                                                  steps: item.steps,
                                                  colors: item.colors,
                                                ),
                                              ),
                                        ),
                                      );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: index == 0 ? 175 : 287,
                                  decoration: BoxDecoration(
                                    color: item.colors?[5],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(item.imagePath),
                                      Container(
                                        height:
                                            category.categoryFields[index].id ==
                                                    0
                                                ? 35.w
                                                : 80.w,
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
                                                          ? 18.6.w
                                                          : 23.w,
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
                                                      fontSize: 12.sp,
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
                                                      return Text(
                                                        '${state.steps[item.id] ?? 0}  / ${item.steps?.length}',
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

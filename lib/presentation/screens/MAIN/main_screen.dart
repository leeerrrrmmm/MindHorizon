import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/home/detail_home_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/meditation_detail_screen.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/music/second_detail_music_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8ecd6),
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset('assets/img/lvec.png')),
          Positioned(right: 0, child: Image.asset('assets/img/rvec.png')),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 15),
            child: BlocBuilder<MeditationBloc, MeditationState>(
              builder: (context, state) {
                return ListView.builder(
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
                            fontSize:
                                MediaQuery.of(context).size.height < 896
                                    ? 30.sp
                                    : 30.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xfffea386),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 175,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: myCategory.categoryFields.length,
                            itemBuilder: (context, secIndex) {
                              final secondItem =
                                  myCourseCategory[index]
                                      .categoryFields[secIndex];
                              int currentStep =
                                  state.steps[secondItem.id] ??
                                  (secondItem.curStepListened ?? 0);

                              return GestureDetector(
                                onTap: () {
                                  if (secondItem.title == '') {
                                    // DetailHomeScreen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
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
                                    );
                                  } else if (index == 2) {
                                    // Music
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
                                            ) => DetailMusicScreen(
                                              soundsList: secondItem.sounds!,
                                              initialElemId:
                                                  secondItem
                                                      .sounds![currentStep]
                                                      .id,
                                              categoryTitle: secondItem.title,
                                              soundsTitle:
                                                  secondItem
                                                      .sounds![currentStep]
                                                      .title,
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
                                  } else {
                                    // Meditation
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
                                                secItemId: secondItem.id,
                                                stepCounter:
                                                    secondItem.steps!.length,
                                                steps: secondItem.steps,
                                                colors: secondItem.colors,
                                                curStepMusic:
                                                    secondItem
                                                        .steps![currentStep]
                                                        .stepAsset,
                                              ),
                                            ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  width:
                                      myCategory.categoryFields.length > 1 &&
                                              myCategory
                                                      .categoryFields
                                                      .length <=
                                                  3
                                          ? 175
                                          : myCategory.categoryFields.length <=
                                                  4 &&
                                              myCategory.categoryFields.length >
                                                  1
                                          ? 100
                                          : 400,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        secondItem.title == ''
                                            ? null
                                            : secondItem.colors?[0],
                                  ),
                                  child:
                                      secondItem.title == ''
                                          ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.asset(
                                              secondItem.imagePath,
                                            ),
                                          )
                                          : myCategory.categoryFields.length > 1
                                          ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                secondItem.imagePath,
                                                scale: 1,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                  left: 12,
                                                  top: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                  color: secondItem.colors?[1],
                                                ),
                                                width: double.infinity,
                                                height: 38,
                                                child: BuildText(
                                                  text: secondItem.title,
                                                  fontSize:
                                                      MediaQuery.of(
                                                                context,
                                                              ).size.height <
                                                              896
                                                          ? 18.sp
                                                          : 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      secIndex == 0
                                                          ? Colors.black
                                                          : secIndex == 1
                                                          ? Colors.white
                                                          : Colors.black,
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
                        const SizedBox(height: 20),
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

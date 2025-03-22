import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_event.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_state.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/meditation/meditation_detail_screen.dart';
import 'package:mind_horizon/testt/a.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

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
            child: BlocBuilder<MeditationBloc, MeditationState>(
              builder: (context, state) {
                return ListView.builder(
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
                                fontSize: 32,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 297,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: item.categoryFields.length,
                              itemBuilder: (context, secIndex) {
                                final secItem = item.categoryFields[secIndex];
                                int currentStep =
                                    state.steps[secItem.id] ??
                                    (secItem.curStepListened ?? 0);
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder:
                                            (context) => BlocProvider.value(
                                              value:
                                                  context
                                                      .read<
                                                        MeditationBloc
                                                      >(), // Используем тот же экземпляр BLoC
                                              child: MeditationDetailScreen(
                                                curListenedEl: currentStep,
                                                secItemId: secItem.id,
                                                stepCounter:
                                                    secItem.steps!.length,
                                                steps: secItem.steps,
                                                colors: secItem.colors,
                                              ),
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10.0),
                                    width: 297,
                                    decoration: BoxDecoration(
                                      color:
                                          index == 0
                                              ? secIndex == 0
                                                  ? Color(0xffa3fdbd)
                                                  : Color(0xffead2ef)
                                              : index == 1
                                              ? Color(0xffead2ef)
                                              : index == 2
                                              ? secIndex != 1
                                                  ? Color(0xffff725e)
                                                  : Color(0xff84a8fa)
                                              : index == 3
                                              ? secIndex != 1
                                                  ? Color(0xfffff0c6)
                                                  : Color(0xffbdffd0)
                                              : index == 4
                                              ? secIndex != 1
                                                  ? Color(0xfffff0c6)
                                                  : Color(0xff84a8fa)
                                              : null,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(secItem.imagePath),
                                        Container(
                                          width: double.infinity,
                                          height: 81,
                                          decoration: BoxDecoration(
                                            color:
                                                index == 0
                                                    ? secIndex == 0
                                                        ? Color(0xff92e3a9)
                                                        : Color(0xff9f59ab)
                                                    : index == 1
                                                    ? Color(0xff9f59ab)
                                                    : index == 2
                                                    ? secIndex != 1
                                                        ? Color(0xffcc5b4b)
                                                        : Color(0xff407bff)
                                                    : index == 3
                                                    ? secIndex != 1
                                                        ? Color(0xffffd252)
                                                        : Color(0xff92e3a9)
                                                    : index == 4
                                                    ? secIndex != 1
                                                        ? Color(0xffffd252)
                                                        : Color(0xff407bff)
                                                    : null,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 5.0,
                                              left: 11.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  secItem.title,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  secItem.description,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                BlocBuilder<
                                                  MeditationBloc,
                                                  MeditationState
                                                >(
                                                  builder: (context, state) {
                                                    return Text(
                                                      'Step listened: ${state.steps[secItem.id] ?? 0} / ${secItem.steps?.length}',
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
                        ],
                      ),
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

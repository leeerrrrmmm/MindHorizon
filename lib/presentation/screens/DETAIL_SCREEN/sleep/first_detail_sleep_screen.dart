import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/sounds_model.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/sleep/second_detail_sleep_screen.dart';

class FirstDetailSleepScreen extends StatefulWidget {
  final String title;
  final String description;
  final String largestImagepath;
  final List<SoundsModel>? sounds;
  final List<Color>? itemColors;
  final int indexEl;
  const FirstDetailSleepScreen({
    super.key,
    required this.title,
    required this.description,
    required this.largestImagepath,
    required this.sounds,
    required this.indexEl,
    required this.itemColors,
  });

  @override
  State<FirstDetailSleepScreen> createState() => _FirstDetailSleepScreenState();
}

class _FirstDetailSleepScreenState extends State<FirstDetailSleepScreen> {
  int curEl = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.itemColors?[7],
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: widget.itemColors?[7],
        centerTitle: false,
        leading: SizedBox(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MindHorizon',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: widget.itemColors?[2],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  backgroundColor: widget.itemColors?[2],
                  radius: 24,
                  child: Center(
                    child: Icon(Icons.close, size: 28, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 440,
              height: 452.1,
              decoration: BoxDecoration(
                color: widget.itemColors?[3],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: widget.indexEl != 0 ? 10 : 0),
                  Image.asset(widget.largestImagepath),
                  Container(
                    width: 440,
                    height: 100,
                    decoration: BoxDecoration(color: widget.itemColors?[4]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildText(
                            text: widget.title,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff455a64),
                          ),
                          BuildText(
                            text: widget.description,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff455a64),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.sounds!.length,
              itemBuilder: (context, index) {
                final steps = widget.sounds![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                SecondDetailSleepScreen(
                                  categoryTitle: widget.title,
                                  stepTitle: steps.title,
                                  colors: widget.itemColors,
                                ),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0.0, -1.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 62,
                    decoration: BoxDecoration(
                      color:
                          index % 2 == 0
                              ? widget.itemColors![6]
                              : widget.itemColors?[5],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 14.0,
                              ),
                              child: BuildText(
                                text: '${(index + 1).toString()}.',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff455a64),
                              ),
                            ),
                            BuildText(
                              text: steps.title,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff455a64),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: widget.itemColors?[2],
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

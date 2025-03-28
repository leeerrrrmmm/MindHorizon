import 'package:flutter/material.dart';
import 'package:mind_horizon/components/build_text.dart';
import 'package:mind_horizon/data/models/sounds_model.dart';
import 'package:mind_horizon/presentation/screens/DETAIL_SCREEN/music/second_detail_music_screen.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<SoundsModel>? sounds;
  final int indexEl;
  const DetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.sounds,
    required this.indexEl,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int curEl = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8ecd6),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xfff8ecd6),
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
                color: Color(0xfffea386),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xfffea386),
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
                color: Color(0xfffea386),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.imagePath,
                    scale: widget.indexEl == curEl ? 1.04 : 0.9,
                  ),
                  Container(
                    width: 440,
                    height: 100,
                    decoration: BoxDecoration(color: Color(0xfffbc9aa)),
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
              itemCount: widget.sounds?.length,
              itemBuilder: (context, index) {
                final sounds = widget.sounds?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                DetailMusicScreen(
                                  categoryTitle: widget.title,
                                  soundsTitle: widget.sounds?[index].title,
                                  musicAsset: widget.sounds![index].musicAsset,
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
                              ? Color(0xfffea386).withValues(alpha: 0.6)
                              : Color(0xfffbc9aa),
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
                              text: sounds!.title,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff455a64),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Color(0xfffea386),
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

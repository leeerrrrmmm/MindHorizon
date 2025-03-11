import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_horizon/components/app_bar.dart';
import 'package:mind_horizon/presentation/screens/MAIN/main_screen.dart';
import 'package:mind_horizon/presentation/screens/MEDITATION_SCREEN/meditation_screen.dart';
import 'package:mind_horizon/presentation/screens/MUSIC_SCREEN/music_screen.dart';
import 'package:mind_horizon/presentation/screens/SLEEP_SCREEN/sleep_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedPage = 0;

  static const List<Widget> pages = [
    MainScreen(),
    SleepScreen(),
    MeditationScreen(),
    MusicScreen(),
    Center(child: Text('Profile')),
  ];

  static const List<IconData> icons = [
    Icons.home_filled,
    CupertinoIcons.moon,
    CupertinoIcons.wind,
    Icons.music_note,
    CupertinoIcons.person,
  ];

  static const List<String> titles = [
    'Home',
    'Sleep',
    'Meditation',
    'Music',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xfff8ecd6),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: const BoxDecoration(
          color: Color(0xfffea386),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(48),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(pages.length, (index) {
                final bool isSelected = selectedPage == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: 59,
                        height: 39,
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color(0xfffbe7c3)
                                  : Color(0xfffea386),
                          borderRadius: BorderRadius.circular(49),
                        ),
                        child: Icon(
                          icons[index],
                          size: 25,
                          color:
                              isSelected
                                  ? const Color(0xfffea386)
                                  : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        titles[index],
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              isSelected
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      body: pages[selectedPage],
    );
  }
}

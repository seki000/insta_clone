import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/view/activity/page/activity_page.dart';
import 'package:insta_clone/view/feed/pages/feed_page.dart';
import 'package:insta_clone/view/post/page/post_page.dart';
import 'package:insta_clone/view/profile/page/profile_page.dart';
import 'package:insta_clone/view/search/pages/search_page.dart';

import '../generated/l10n.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      FeedPage(),
      SearchPage(),
      PostPage(),
      ActivityPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: S.of(context).home,
                icon: FaIcon(FontAwesomeIcons.house),
            ),
            BottomNavigationBarItem(
              label: S.of(context).search,
              icon: FaIcon(FontAwesomeIcons.researchgate),
            ),
            BottomNavigationBarItem(
              label: S.of(context).add,
              icon: FaIcon(FontAwesomeIcons.squarePlus),
            ),
            BottomNavigationBarItem(
              label: S.of(context).activities,
              icon: FaIcon(FontAwesomeIcons.heart),
            ),
            BottomNavigationBarItem(
              label: S.of(context).user,
              icon: FaIcon(FontAwesomeIcons.user),
            ),
          ]),
      body: _pages[_currentIndex]
    );
  }
}

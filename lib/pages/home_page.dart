import 'package:flutter/material.dart';
import 'package:nft_appui_master/components/my_tabbar.dart';
import 'package:nft_appui_master/tabs/top_tab.dart';
import 'package:nft_appui_master/tabs/trending_tab.dart';
import 'package:nft_appui_master/util/glass_box.dart';
import '../components/my_appbar.dart';
import '../components/my_bottombar.dart';
import '../tabs/recent_tab.dart';
import '../theme/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void searchButtonTapped() {}

  List tabOption = [
    ["Recent", const RecentTab()],
    ["Trending", const TrendingTab()],
    ["Top", const TopTab()],
  ];

  int _currentBottonIndex = 0;
  void _handleIndexChanged(int? index) {
    setState(() {
      _currentBottonIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        bottomNavigationBar: GlassBox(
          child: MyBottomBar(
            index: _currentBottonIndex,
            onTap: _handleIndexChanged,
          ),
        ),
        body: ListView(
          children: [
            MyAppBar(
              title: 'Explore Collections',
              onSearchTap: searchButtonTapped,
            ),
            SizedBox(
              height: 600,
              child: MyTabBar(
                tabOptions: tabOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/tabs/home_tab.dart';
import 'package:flutter_ecommerce_test/tabs/saved_tab.dart';
import 'package:flutter_ecommerce_test/tabs/search_tab.dart';
import 'package:flutter_ecommerce_test/widgets/bottom_tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  PageController _tabsPageController;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged:(num){
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                HomeTab(),
                SearchTab(),
                SavedTab()
              ],
            ),
          ),
          BottomTabs(
            selectedTab: _selectedTab,
            tabsPressed:(num){
              _tabsPageController.animateToPage(num, duration: Duration(milliseconds: 300), curve: Curves.easeInOutCirc);
            },
          ),
        ],
      )
    );
  }
}

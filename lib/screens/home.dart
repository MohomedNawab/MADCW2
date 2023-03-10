import 'package:deliveryapp/tabs/home_tab.dart';
import 'package:deliveryapp/tabs/saved_tab.dart';
import 'package:deliveryapp/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:deliveryapp/widget/bottom_tabs.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController? _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              child: PageView(
                controller: _tabsPageController,
                onPageChanged: (num){
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  HomeTab(),
                  SearchTab(),
                  SavedTab(),
                ],
              ),
            ),
          ),
          BottomTabs(
            selectedTab: _selectedTab,
            tabPressed: (num){
              _tabsPageController?.animateToPage(num,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInCubic);
            }
          ),
        ],
      ),
    );
  }
}

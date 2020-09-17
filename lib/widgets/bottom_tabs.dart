import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1.0,
              blurRadius: 30.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            iconData: Icons.home,
            selected: _selectedTab == 0 ? true : false,
            onPressed:(){
              setState(() {
                _selectedTab = 0;
              });
            },
          ),
          BottomTabBtn(
            iconData: Icons.search,
            selected: _selectedTab == 1 ? true : false,
            onPressed:(){
              setState(() {
                _selectedTab = 1;
              });
            },
          ),
          BottomTabBtn(
            iconData: Icons.bookmark_border,
            selected: _selectedTab == 2 ? true : false,
            onPressed:(){
              setState(() {
                _selectedTab = 2;
              });
            },
          ),
          BottomTabBtn(
            iconData: Icons.exit_to_app,
            selected: _selectedTab == 3 ? true : false,
            onPressed:(){
              setState(() {
                _selectedTab = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final IconData iconData;
  final bool selected;
  final Function onPressed;

  BottomTabBtn({this.iconData, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: _selected ? Color(0xFFFF1E00) : Colors.transparent,
                    width: 2))),
        child: Icon(
          iconData,
          size: 30,
          color: _selected ? Color(0xFFFF1E00) : Colors.black,
        ),
      ),
    );
  }
}

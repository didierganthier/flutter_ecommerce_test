import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(iconData: Icons.home, selected: true,),
          BottomTabBtn(iconData: Icons.search,),
          BottomTabBtn(iconData: Icons.bookmark_border,),
          BottomTabBtn(iconData: Icons.exit_to_app,),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final IconData iconData;
  final bool selected;

  BottomTabBtn({this.iconData, this.selected});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: _selected? Color(0xFFFF1E00) : Colors.transparent,
            width: 2
          )
        )
      ),
      child: Icon(
        iconData,
        size: 30,
        color: _selected? Color(0xFFFF1E00) : Colors.black,
      ),
    );
  }
}

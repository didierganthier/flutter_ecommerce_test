import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasTitle;
  final bool hasBackArrow;

  CustomActionBar({this.title, this.hasBackArrow, this.hasTitle});

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;

    return Container(
      padding: EdgeInsets.only(
        top: 56.0,
        bottom: 24.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_hasBackArrow)
            Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                alignment: Alignment.center,
              child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18,), onPressed:(){},),
              ),
          if(_hasTitle)
            Text(
              title ?? "Action Bar",
              style: Constants.boldHeading,
            ),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            alignment: Alignment.center,
            child: Text(
              "0",
              style: Constants.regularHeading.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

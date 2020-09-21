import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasTitle;
  final bool hasBackArrow;
  final bool hasBackground;

  CustomActionBar({this.title, this.hasBackArrow, this.hasTitle, this.hasBackground});

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
        gradient: _hasBackground? LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.5)
          ],
          begin: Alignment(0, 0),
          end: Alignment(0, 1)
        ) : null,
      ),
      padding: EdgeInsets.only(
        top: 56.0,
        bottom: 24.0,
        left: 24.0,
        right: 46.0,
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

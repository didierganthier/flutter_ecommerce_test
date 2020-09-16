import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/widgets/bottom_tabs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Center(
              child: Text(
                  "HomePage"
              ),
            ),
          ),
          BottomTabs(),
        ],
      )
    );
  }
}

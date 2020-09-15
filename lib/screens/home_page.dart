import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Firebase App Initialized", style: Constants.regularHeading,),
        ),
      ),
    )
  }
}

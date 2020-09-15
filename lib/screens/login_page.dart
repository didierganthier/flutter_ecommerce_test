import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/widgets/custom_btn.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 24.0,
              ),
              child: Text(
                "Welcome User,\nLogin to your account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,
              ),
            ),
            Column(
              children: [
                Text("Inputs"),
                Text("Inputs"),
                Text("Inputs"),
              ],
            ),
            CustomBtn(
              text: "Create New Account",
              onPressed:(){
                print("Clicked the Create Account Button");
              },
              outlineBtn: true,
            ),
          ],
        ),
      ),
    ));
  }
}

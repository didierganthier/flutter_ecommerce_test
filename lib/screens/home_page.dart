import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed:(){
            FirebaseAuth.instance.signOut();
          },
          child: Text(
            "Logout",
            style: Constants.regularHeading,
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/screens/home_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            body: Text('Error ${snapshot.error}', style: Constants.regularHeading,),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return HomePage();
        }
        return Scaffold(
          body: Container(
            child: Center(
              child: Text("Initialization...", style: Constants.regularHeading,),
            ),
          ),
        );
      },
    );
  }
}

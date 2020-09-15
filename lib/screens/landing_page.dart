import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/screens/home_page.dart';
import 'package:flutter_ecommerce_test/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        //If snapshot has error
        if(snapshot.hasError){
          return Scaffold(
            body: Text('Error ${snapshot.error}', style: Constants.regularHeading,),
          );
        }

        //Connection Initialized - Firebase App is running
        if(snapshot.connectionState == ConnectionState.done){

          //StreamBuilder can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              //If Stream Snapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Text('Error ${streamSnapshot.error}',
                    style: Constants.regularHeading,),
                );
              }

              //Connection State active - Do the user login check inside the if statement
              if(streamSnapshot.connectionState == ConnectionState.active){

                //Get the user
                User _user = streamSnapshot.data;

                //if the user is null, we're not logged in
                if(_user == null){
                  //user not logged in, head to Login
                  return LoginPage();
                }
                else {
                  //user logged in, head to HomePage
                  return HomePage();
                }
              }

              //Checking the Auth State - Loading
              return Scaffold(
                body: Container(
                  child: Center(
                    child: Text("Initialization...", style: Constants.regularHeading,),
                  ),
                ),
              );
            }
          );
        }

        //Connecting ro Firebase - Loading
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

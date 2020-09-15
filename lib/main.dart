import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            body: Text('Error ${snapshot.error}'),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return Scaffold(
            body: Container(
              child: Center(
                child: Text("Firebase App Initialized"),
              ),
            ),
          );
        }
        return Scaffold(
          body: Container(
            child: Center(
              child: Text("Initialization..."),
            ),
          ),
        );
      },
    );
  }
}

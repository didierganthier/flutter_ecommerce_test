import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/widgets/custom_action_bar.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Scaffold(
                  body: Center(
                    child: Text("Error ${snapshot.error}"),
                  ),
                );
              }
              if(snapshot.connectionState == ConnectionState.done){
                return ListView(
                  padding: EdgeInsets.only(top: 108.0, bottom: 12.0),
                  children: snapshot.data.docs.map((document){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      height: 300.0,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          "${document.data()['images'][0]}",
                          fit: BoxFit.cover,
                        ),
                      )
                    );
                  }).toList(),
                );
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            title: "Home",
            hasTitle: true,
            hasBackArrow: false,
          ),
        ],
      ),
    );
  }
}

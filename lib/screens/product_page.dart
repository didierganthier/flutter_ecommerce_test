import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/services/firebase_services.dart';
import 'package:flutter_ecommerce_test/widgets/custom_action_bar.dart';
import 'package:flutter_ecommerce_test/widgets/image_swipe.dart';
import 'package:flutter_ecommerce_test/widgets/product_size.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  String _selectedProductSize = "0";

  Future _addToCart() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.productId)
        .set({"size": _selectedProductSize});
  }

  final SnackBar _snackBar = SnackBar(content: Text("Product added to the cart"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.productsRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Firebase Document Data Map
                Map<String, dynamic> documentData = snapshot.data.data();

                // List of images
                List imageList = documentData['images'];

                //List of product sizes
                List productSizes = documentData['size'];

                //Set an initial size
                _selectedProductSize = productSizes[0];

                return ListView(
                  children: [
                    ImageSwipe(imageList: imageList),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 4.0,
                        top: 24.0,
                        left: 24.0,
                        right: 24.0,
                      ),
                      child: Text(
                        "${documentData["name"]}" ?? "Product Name",
                        style: Constants.boldHeading,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 24.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "\$${documentData["price"]}" ?? "Price",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.attach_money,
                            color: Theme.of(context).accentColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "\$${documentData["desc"]}" ?? "Description",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "Select size",
                        style: Constants.boldHeading.copyWith(fontSize: 16),
                      ),
                    ),
                    ProductSize(
                      productSizes: productSizes,
                      onSelected:(size){
                        _selectedProductSize = size;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFDCDCDC),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(
                                Icons.bookmark_border,
                                size: 22.0,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await _addToCart();
                                Scaffold.of(context).showSnackBar(_snackBar);
                              },
                              child: Container(
                                height: 65.0,
                                margin: EdgeInsets.only(
                                  left: 16.0,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12.0)),
                                alignment: Alignment.center,
                                child: Text(
                                  "Add To Cart",
                                  style: Constants.regularHeading.copyWith(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            hasBackArrow: true,
            hasTitle: false,
            hasBackground: false,
            
          )
        ],
      ),
    );
  }
}

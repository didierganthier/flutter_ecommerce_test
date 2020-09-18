import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/widgets/custom_action_bar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Home Tab"),
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

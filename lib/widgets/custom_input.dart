import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function (String) onChanged;
  final Function (String) onSubmitted;
  final FocusNode focusNode;

  CustomInput({this.hintText, this.onChanged, this.onSubmitted, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.0,)
      ),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "Hint Text",
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 24.0
          )
        ),
        style: Constants.regularHeading.copyWith(fontSize: 16.0),
      ),
    );
  }
}

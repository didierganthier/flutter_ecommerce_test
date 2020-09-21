import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';

class ProductSize extends StatefulWidget {
  final List productSizes;
  final Function(String) onSelected;

  ProductSize({this.productSizes, this.onSelected});

  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: [
          for (var i = 0; i < widget.productSizes.length; i++)
            GestureDetector(
              onTap: () {
                widget.onSelected("${widget.productSizes[i]}");
                setState(() {
                  _selected = i;
                });
              },
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: _selected == i ? Theme.of(context).accentColor : Color(0xFFDCDCDC),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: Text(
                  "${widget.productSizes[i]}",
                  style: Constants.regularHeading.copyWith(
                    fontSize: 16.0,
                    color: _selected == i ? Colors.white : Colors.black,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

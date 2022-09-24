import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../const/appColors.dart';
import '../../widgets/fetchProducts.dart';
import '../../widgets/totalPrice.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: fetchData("users-cart-items"),
                height:MediaQuery.of(context).size.height -220,
              ),
            ),
          ),

          TotalPrice(),
        ],
      ),
    );
  }
}

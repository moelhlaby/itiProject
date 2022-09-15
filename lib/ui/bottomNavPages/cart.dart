import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../const/AppColors.dart';
import '../../widgets/fetchProducts.dart';
import '../../widgets/totalPrice.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  dynamic amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: fetchData("users-cart-items"),
          ),
          // Container(
          //   margin: EdgeInsets.only(top:550),
          //   width: double.infinity,
          //   height: 100,
          //   decoration: BoxDecoration(
          //     color: AppColors.deep_orange,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(30),
          //       topRight: Radius.circular(30),
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "Total: \$$amount ",
          //         style: TextStyle(color: Colors.white, fontSize: 22),
          //       ),
          //
          //     ],
          //   ),
          //
          // ),
          TotalPrice(),
        ],
      ),
    );
  }
}


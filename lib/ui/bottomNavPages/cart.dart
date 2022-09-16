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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: fetchData("users-cart-items"),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 680),
          //   width: double.infinity,
          //   height: 100,
          //   decoration: BoxDecoration(
          //     color: AppColors.deep_orange,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(30),
          //       topRight: Radius.circular(30),
          //     ),
          //   ),
          //   child: Center(
          //       child: Text(
          //     "Total: 125\$ ",
          //
          //     style: TextStyle(color: Colors.white, fontSize: 22),
          //   )),
          // ),
          TotalPrice()
        ],
      ),
    );
  }
}

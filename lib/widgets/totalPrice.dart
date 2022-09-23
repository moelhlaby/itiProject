import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const/AppColors.dart';

class TotalPrice extends StatefulWidget {
  TotalPrice({Key? key}) : super(key: key);

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  final dataBase = FirebaseFirestore.instance
      .collection("users-cart-items")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("items")
      .snapshots();
  double? amount = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: dataBase,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          for (i;
              i < (snapshot.data == null ? 0 : snapshot.data!.docs.length);
              i++) {
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[i];
            amount = (amount! + _documentSnapshot["price"]);
          }

          return snapshot.data == null
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.deep_orange,
                ))
              : Container(
                  margin: EdgeInsets.only(top: 530),
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    color: AppColors.deep_orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total price: ${amount!.roundToDouble().toString()}\$ ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Total items: ${snapshot.data!.docs.length.toString()} ",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.white,
                        child: Text(
                          "Check Out",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                );
        });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const/AppColors.dart';



class TotalPrice extends StatefulWidget {
  const TotalPrice({Key? key}) : super(key: key);

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  final dataBase = FirebaseFirestore.instance
      .collection("users-cart-items")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("items")
      .snapshots();
  int? amount=0;
  int i=0;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dataBase,
        builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

          for(i;i<snapshot.data!.docs.length;i++){
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[i];
            amount=(amount!+_documentSnapshot["price"]) as int?;
          }

        return Container(
          margin: EdgeInsets.only(top: 680),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color:AppColors.deep_orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
              child: Text(
                "Total: $amount\$ ",

                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
        ) ;
        }
    );
  }
}

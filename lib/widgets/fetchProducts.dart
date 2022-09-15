import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../const/AppColors.dart';

Widget fetchData(String collectionName) {

  final dataBase = FirebaseFirestore.instance
      .collection(collectionName)
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("items")
      .snapshots();

  return StreamBuilder(
    stream: dataBase,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Something is wrong"),
        );
      }



      return ListView.builder(
          itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
          itemBuilder: (_, index) {
            DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              child: Card(
                elevation: 3.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          image: NetworkImage(_documentSnapshot['images'][0]),
                          fit: BoxFit.fill,
                        ),
                        width: 80,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _documentSnapshot['name'],
                              style: TextStyle(fontSize: 17.5),
                              maxLines: 1,
                              overflow:TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " \$${_documentSnapshot['price']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: AppColors.deep_orange),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      GestureDetector(
                        child: Icon(
                          Icons.remove_circle,
                          size: 27,
                          color: AppColors.deep_orange,
                        ),
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection(collectionName)
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection("items")
                              .doc(_documentSnapshot.id)
                              .delete();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    },
  );
}

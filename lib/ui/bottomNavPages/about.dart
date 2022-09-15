// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const About());
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,

      //   // title: Text(" ",
      //   //     style: TextStyle(
      //   //         color: Colors.black,
      //   //         fontSize: 20,
      //   //         fontWeight: FontWeight.w700)),
      //   // centerTitle: true,
      //   //backgroundColor: Colors.white,
      //   elevation: 20,
      // ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.only(left: 40),
        //margin: EdgeInsets.only(top: 10),
        child: Container(
          child: Column(children: [
            Container(
              child: Text(
                "About",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 50),
              ),
              // color: AppColors.deep_orange,
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                  //color: AppColors.deep_orange,
                  borderRadius: BorderRadius.circular(12)),
            ),
            Container(
              //color: Color(0xFFBBBBBB),
              height: 140,
              width: 500,
              alignment: Alignment.center,
              child: Text(
                "This App You Can Buy Dress, Shirt, Shoes, Pant And Tie And Many Other Product In Cheap Price, Now Its Time to Buy SomeThing",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              decoration: BoxDecoration(
                  // color: Color(0xFFBBBBBB),
                  borderRadius: BorderRadius.circular(12)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: 25,
              //width: 100,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      // margin: EdgeInsets.all(2),
                      // color: Color(0xFFFF6B6B),
                      height: 50,
                      width: 300,
                      alignment: Alignment.center,
                      child: Text(
                        "Developers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 50),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFFF6B6B),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      //color: Color(0xFFBBBBBB),
                      height: 110,
                      width: 220,
                      alignment: Alignment.center,
                      child: Text(
                        "Mohamed Magdy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 26),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFBBBBBB),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      //color: Color(0xFFBBBBBB),
                      height: 110,
                      width: 220,
                      alignment: Alignment.center,
                      child: Text(
                        "Mohamed Abdelmonem",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 26),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFBBBBBB),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      //color: Color(0xFFBBBBBB),
                      height: 110,
                      width: 220,
                      alignment: Alignment.center,
                      child: Text(
                        "Walaa Yahia",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 26),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFBBBBBB),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      // color: Color(0xFFBBBBBB),
                      height: 110,
                      width: 220,
                      alignment: Alignment.center,
                      child: Text(
                        "Tasnim siam",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 26),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFBBBBBB),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(7),
                      //color: Color(0xFFBBBBBB),
                      height: 110,
                      width: 220,
                      alignment: Alignment.center,
                      child: Text(
                        "Nadeen Amr",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 26),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFBBBBBB),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
              //color: AppColors.deep_orange,
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFF6B6B),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ]),
        ),
      ),
    );
  }
}

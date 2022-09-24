import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../const/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../productDetailScreen.dart';
import '../searchScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;
  var categoryImage = [
  ['Men', 'assets/images/category/Men.jpg'],
  ['Women', 'assets/images/category/women.jpg'],
  ['Kids', 'assets/images/category/kids.jpg'],
  ['Watches', 'assets/images/category/watch.jpg'],
  ['Shoes', 'assets/images/category/shoes.jpg'],
  ['Sunglasses', 'assets/images/category/sunglass.jpeg'],
  ['Sportswear', 'assets/images/category/sportwear.jpg'],
  ['Electronics', 'assets/images/category/electronics.webp'],
  ];

  fetchCarouselImages() async {
    QuerySnapshot qn =
    await _firestoreInstance.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
        print(qn.docs[i]["img-path"]);
      }
    });

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-img": qn.docs[i]["product-img"],
        });
      }
    });

    return qn.docs;
  }
  Widget buildCategoriesItem(int index) {
    return GestureDetector(
      onTap: ()
    {
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 130,
            child: Image.asset((categoryImage[index][1]
              ),fit: BoxFit.cover,width: 100,
              height: 130,
            ),
          ),
          Container(
            child: Text(
              categoryImage[index][0],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.black.withOpacity(.6),
            width: 100,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: Expanded(
              child: SingleChildScrollView(
                physics:BouncingScrollPhysics() ,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: "Search products here",
                          hintStyle: TextStyle(fontSize: 15.sp),
                        ),
                        onTap: () => Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => SearchScreen())),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AspectRatio(
                      aspectRatio: 2,
                      child: CarouselSlider(
                          items: _carouselImages
                              .map((item) => Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(item),
                                      fit: BoxFit.fill)),
                            ),
                          ))
                              .toList(),
                          options: CarouselOptions(
                            scrollPhysics: ClampingScrollPhysics(),
                              autoPlay: true,

                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              onPageChanged: (val, carouselPageChangedReason) {
                                setState(() {
                                  _dotPosition = val;
                                });
                              })),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DotsIndicator(
                      dotsCount:
                      _carouselImages.length == 0 ? 1 : _carouselImages.length,
                      position: _dotPosition.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: AppColors.deep_orange,
                        color: AppColors.deep_orange.withOpacity(0.5),
                        spacing: EdgeInsets.all(2),
                        activeSize: Size(8, 8),
                        size: Size(6, 6),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 130,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return buildCategoriesItem(index);
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                                itemCount: categoryImage.length),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'New Products',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(

                      child: GridView.builder(
                          shrinkWrap: true ,
                          clipBehavior: Clip.hardEdge,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _products.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.85,crossAxisCount: 2,mainAxisSpacing: 3,crossAxisSpacing: 2),
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetailScreen(_products[index]))),
                              child: Card(
                                elevation: 3,
                                child: Container(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            color: Colors.yellow,
                                            child:Image(image:NetworkImage(
                                              _products[index]["product-img"][0],

                                            ), fit: BoxFit.cover,) ),
                                      ),
                                      Text("${_products[index]["product-name"]}"),
                                      Text(
                                          "\$${_products[index]["product-price"].toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
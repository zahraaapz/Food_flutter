import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/strings.dart';
import 'package:food_flutter/screen/detail_product.dart';
import 'package:food_flutter/widget/vertical_product.dart';
import '../widget/app_bar.dart';

class MainScreen extends StatefulWidget {
  final Future<List> products;

  const MainScreen(this.products, {super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.products.then((value) => setState(() {
          list = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(
          childs: Text(MyStrings.items),
        ),
        backgroundColor: MyColor.bgColor,
        body: list.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth.height,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 50, left: 15, right: 15),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (screenWidth.width - 45) / (2 * 290),
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemCount: list.length,
                        itemBuilder: (context, i) {
                          if (i % 2 == 0) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailProduct(
                                          product: list[i],
                                          i: i,
                                        ),
                                      ));
                                },
                                child: VerticalProductCard(
                                    product: list[i], i: i));
                          }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailProduct(
                                      product: list[i],
                                      i: i,
                                    ),
                                  ));
                            },
                            child: OverflowBox(
                              maxHeight: 290.0 + 70.0,
                              child: Container(
                                color: Colors.transparent,
                                margin: const EdgeInsets.only(top: 70),
                                child:
                                    VerticalProductCard(product: list[i], i: i),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}

import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';
import 'package:food_flutter/component/style.dart';

class ProductsGrid extends StatefulWidget {
  final Future<List> products;

  ProductsGrid(this.products);

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColor.bgColor,
          body: list.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 50, left: 15, right: 15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (screenWidth - 45) / (2 * 290),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    // Product Card has fixed height 290, screenWidth must substract the total horizontal padding of GridView
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    if (i % 2 == 0) {
                      return VerticalProductCard(product: list[i]);
                    }
                    return GestureDetector(
                      onTap: () {
                        print('Tapped');
                      },
                      child: OverflowBox(
                        maxHeight: 290.0 + 70.0,
                        child: Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 70),
                          child: VerticalProductCard(product: list[i]),
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator()),
    );
  }
}

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key, this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: 290,
        width: 200,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 14,
              blurStyle: BlurStyle.normal,
              spreadRadius: 2)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image.network(product.imgUrl).image)),
            ),
            Text(
              product.name,
              style:
                  MyStyle.textStyle.copyWith(color: Colors.black, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

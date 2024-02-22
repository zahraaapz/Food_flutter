import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/color.dart';


class MainListScreen extends StatefulWidget {
  const MainListScreen({super.key, required this.product});
  final Future<List> product;

  @override
  State<MainListScreen> createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
  List list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.product.then((value) => setState(() {
          list = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.bgColor,
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing:8, crossAxisCount: 2, mainAxisSpacing:12),
                itemBuilder: (context, index) {
                  return Container(
                    width: 220,
                    height: 270,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 14,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 2)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
          Container(
            width: 130,
            height: 130,
            decoration:  BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.network(
                      list[index].imgUrl,
                    ).image)),
          )  ,                     
                        Text(
                          list[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

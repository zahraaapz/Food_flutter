import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/screen/detail_product.dart';
import 'package:food_flutter/widget/frame_image.dart';

class SuggList extends StatefulWidget {
  const SuggList({super.key, required this.product});
  final Future<List> product;

  @override
  State<SuggList> createState() => _SuggListState();
}

class _SuggListState extends State<SuggList> {
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
    return SizedBox(
        height: 360,
        child: list.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return StackForLists(
                    list: list,
                    i: index,
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()));
  }
}

class StackForLists extends StatelessWidget {
  const StackForLists({
    super.key,
    required this.list,
    required this.i,
  });

  final List list;
  final i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder:(context) => DetailProduct(product:list[i], i: i),));
      },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 38, left: 18),
          width: 220,
          height: 240,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
            
                color: Colors.black12,
                blurRadius: 14,
                blurStyle: BlurStyle.normal,
                spreadRadius: 2)
          ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [(Dimens.large * 2).height, Text(list[i].name)],
          ),
        ),
        Positioned(
            left: 65,
            top: 15,
            child: 
            FrameImage(product:list[i]),)
      ]),
    );
  }
}



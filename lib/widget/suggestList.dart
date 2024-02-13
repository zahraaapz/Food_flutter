import 'package:flutter/material.dart';

class SuggList extends StatelessWidget {
  SuggList({super.key, required this.product});
  List product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 38, left: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('mnjh')],
              ),
              width: 220,
              height: 270,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2)
              ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
            ),
            Positioned(
                left: 60,
                top: 15,
                child: Container(
                  width: 120,
                  height: 110,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                     
                      image: DecorationImage(fit:BoxFit.cover,
                          image: Image.asset('assets/image/5.png').image)),
                )),
          ]);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../color.dart';

class StackInSplash extends StatelessWidget {
  const StackInSplash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            right:0 , top: 50, child: Image.asset('assets/image/1.png',scale:0.9)),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors:MyColor.gradientColor1
                    ),
            ),
          ),
        ),
        Positioned(
            left: 5,
            bottom: 0,
            top: 10,
            child: Image.asset(
              'assets/image/2.png',
              scale:0.9,
            )),
                            Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors:MyColor.gradientColor2),
            ),
          ),
        ),
            
      ],
    );
  }
}
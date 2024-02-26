import 'package:flutter/material.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/screen/main_list_screen.dart';
import 'package:food_flutter/screen/register_screen.dart';
import 'package:food_flutter/screen/splash_screen.dart';

import '../screen/main_screen.dart';

Map<String,Widget Function(BuildContext)>route=
  {
    RouteName.root:(context) => const SplashScreen(),
    RouteName.mainScreen:(context) => const MainScreen(),
    RouteName.registerScreen:(context) =>const RegisterScreen(),
  };

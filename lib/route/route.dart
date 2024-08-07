import 'package:flutter/material.dart';
import 'package:food_flutter/route/name.dart';
import 'package:food_flutter/screen/des_screen.dart';
import 'package:food_flutter/screen/register/register_screen.dart';

import '../screen/home/home_screen.dart';
import '../screen/profile/profile_screen.dart';

Map<String,Widget Function(BuildContext)>route=
  {
    RouteName.profile:(context) => ProfileScreen(),
    RouteName.homeScreen:(context) =>  HomeScreen(),
    RouteName.registerScreen:(context) =>const RegisterScreen(),
    RouteName.destination:(context) =>const DestinationScreen(),
  };

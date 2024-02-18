import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_flutter/data/repo/home_repo.dart';
import 'package:food_flutter/data/src/home_data_src.dart';



HomeRepository homeRepository=HomeRepository(HomeRemoteDataSrc(Dio()));


import 'package:dio/dio.dart';
import 'package:food_flutter/data/model/drink.dart';
import 'package:food_flutter/data/model/meal.dart';

abstract class IHomeDataSrc{

Future<List<Meal>> mealList(String url);
Future<List<Drink>> drinkList(String url);

}


class HomeRemoteDataSrc implements IHomeDataSrc{

final Dio _dio;
HomeRemoteDataSrc(this._dio);

  @override
  Future<List<Meal>>  mealList(String url) async {
    List<Meal>list=[];
    await _dio.get(url).then((value) {
      value.data['meals'].forEach((element) {
       list.add(Meal.fromJson(element));
      });
    });
    return list;
  }

  @override
  Future<List<Drink>> drinkList(String url)async {
        List<Drink>list=[];
    await _dio.get(url).then((value) {
      value.data['drinks'].forEach((element) {
       list.add(Drink.fromJson(element));
      }); 
    });
    return list;
  }

}
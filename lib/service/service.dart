import 'package:dio/dio.dart';
import 'package:food_flutter/model/meal.dart';
import '../model/drink.dart';

class Service {
  Dio dio = Dio();

  Future getMealList(String url,List<Meal> list) async {
    await dio.get(url).then((value) {
      value.data['meals'].forEach((element) {
       list.add(Meal.fromJson(element));
      });
    });
  } 
  
  
   Future getDrinkList(String url,List <Drink>list) async {
    await dio.get(url).then((value) {
      value.data['drinks'].forEach((element) {
       list.add(Drink.fromJson(element));
      }); 
    });
  }
}

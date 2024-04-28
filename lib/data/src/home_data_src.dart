import 'package:dio/dio.dart';
import 'package:food_flutter/component/api.dart';
import 'package:food_flutter/data/model/drink.dart';
import 'package:food_flutter/data/model/home.dart';
import 'package:food_flutter/data/model/meal.dart';

abstract class IHomeDataSrc {
  Future<List<Meal>> mealList(String url);
  Future<List<Drink>> drinkList(String url);
  Home getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc {
  final Dio _dio;
  HomeRemoteDataSrc(this._dio);

  @override
  Future<List<Meal>> mealList(String url) async {
    List<Meal> list = [];
    await _dio.get(url).then((value) {
      value.data['meals'].forEach((element) {
        list.add(Meal.fromJson(element));
      });
    });
    return list;
  }

  @override
  Future<List<Drink>> drinkList(String url) async {
    List<Drink> list = [];
    await _dio.get(url).then((value) {
      value.data['drinks'].forEach((element) {
        list.add(Drink.fromJson(element));
      });
    });
    return list;
  }

  @override
  Home getHome() {
    return Home(
        chickenList: mealList(ApiUrl().baseMeal + RouteVersion().chicken),
        pastaList: mealList(ApiUrl().baseMeal + RouteVersion().pasta),
        porkList: mealList(ApiUrl().baseMeal + RouteVersion().pork),
        veganList: mealList(ApiUrl().baseMeal + RouteVersion().vegan),
        sideList: mealList(ApiUrl().baseMeal + RouteVersion().side),
        staterist: mealList(ApiUrl().baseMeal + RouteVersion().starter),
        cocoaList: drinkList(ApiUrl().baseDrink + RouteVersion().cocoa),
        shakeList: drinkList(ApiUrl().baseDrink + RouteVersion().shake),
        dessertList: mealList(ApiUrl().baseMeal + RouteVersion().dessert),
        cocktailList: drinkList(ApiUrl().baseDrink + RouteVersion().cocktail));
  }

}

import 'package:food_flutter/data/model/home.dart';
import 'package:food_flutter/data/src/home_data_src.dart';
import '../model/drink.dart';
import '../model/meal.dart';

abstract class IHomeRepo {
  Future<List<Meal>> mealList(String url);
  Future<List<Drink>> drinkList(String url);
  Home getHome();
}

class HomeRepository implements IHomeRepo {
  IHomeDataSrc iHomeDataSrc;
  HomeRepository(this.iHomeDataSrc);
  @override
  Future<List<Drink>> drinkList(String url) => iHomeDataSrc.drinkList(url);

  @override
  Future<List<Meal>> mealList(String url) => iHomeDataSrc.mealList(url);

  @override
  Home getHome() {
    return iHomeDataSrc.getHome();
  }
}

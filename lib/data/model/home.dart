import 'package:dio/dio.dart';
import 'package:food_flutter/component/api.dart';
import 'package:food_flutter/data/model/drink.dart';
import 'package:food_flutter/data/repo/home_repo.dart';
import 'package:food_flutter/data/src/home_data_src.dart';
import 'meal.dart';

HomeRepository homeRepository = HomeRepository(HomeRemoteDataSrc(Dio()));

class Home {
 late  Future<List<Meal>> chickenList;
 late  Future<List<Meal>> pastaList;
 late  Future<List<Meal>> porkList;
 late  Future<List<Meal>> veganList;
 late  Future<List<Meal>> sideList;
 late  Future<List<Meal>> staterist;
 late  Future<List<Drink>>cocoaList;
 late  Future<List<Drink>>shakeList;
 late  Future<List<Meal>> dessertList;
 late  Future<List<Drink>>cocktailList;

Home() {
    IHomeRepo iHomeRepo = HomeRepository(HomeRemoteDataSrc(Dio()));

   
        chickenList=
            iHomeRepo.mealList(ApiUrl().baseMeal + RouteVersion().chicken);
        pastaList= iHomeRepo.mealList(ApiUrl().baseMeal + RouteVersion().pasta);
        porkList=iHomeRepo.mealList(ApiUrl().baseMeal + RouteVersion().pork);
        veganList= iHomeRepo.mealList(ApiUrl().baseMeal + RouteVersion().vegan);
        sideList= iHomeRepo.mealList(ApiUrl().baseMeal + RouteVersion().side);
        staterist=
            iHomeRepo.mealList(ApiUrl().baseMeal + RouteVersion().starter);
        cocoaList=
            iHomeRepo.drinkList(ApiUrl().baseDrink + RouteVersion().cocoa);
        shakeList=
            iHomeRepo.drinkList(ApiUrl().baseDrink + RouteVersion().shake);
        dessertList=
            iHomeRepo.mealList(ApiUrl().baseMeal + RouteVersion().dessert);
        cocktailList=
            iHomeRepo.drinkList(ApiUrl().baseDrink + RouteVersion().cocktail);

 }
}

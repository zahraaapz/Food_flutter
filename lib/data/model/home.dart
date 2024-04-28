import 'package:dio/dio.dart';
import 'package:food_flutter/data/model/drink.dart';
import 'package:food_flutter/data/repo/home_repo.dart';
import 'package:food_flutter/data/src/home_data_src.dart';
import 'meal.dart';

HomeRepository homeRepository = HomeRepository(HomeRemoteDataSrc(Dio()));

class Home {
 Future<List<Meal>>? chickenList;
 Future<List<Meal>> ?pastaList;
 Future<List<Meal>> ?porkList;
 Future<List<Meal>> ?veganList;
 Future<List<Meal>> ?sideList;
 Future<List<Meal>> ?staterist;
 Future<List<Drink>>?cocoaList;
 Future<List<Drink>>?shakeList;
 Future<List<Meal>> ?dessertList;
 Future<List<Drink>>?cocktailList;



 Home({
  required this.chickenList,
  required this.cocktailList,
  required this.cocoaList,
  required this.pastaList,
  required this.porkList,
  required this.dessertList,
  required this.shakeList,
  required this.sideList,
  required this.staterist,
  required this.veganList,
 });


}

import 'package:food_flutter/data/model/home.dart';
import 'package:food_flutter/data/src/home_data_src.dart';
import '../model/drink.dart';
import '../model/meal.dart';

abstract class IHomeRepo {
  Future<List<Meal>> mealList(String url);
  Future<List<Drink>> drinkList(String url);
  Home getHome();
 Future <List> allProduct();
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
  
  @override
 Future <List> allProduct()async {
    List list=[];
    await getHome().chickenList!.then((value) => list.addAll(value));
    await getHome().cocktailList!.then((value) => list.addAll(value));
    await getHome().cocoaList!.then((value) => list.addAll(value));
    await getHome().dessertList!.then((value) => list.addAll(value));
    await getHome().porkList!.then((value) => list.addAll(value));
    await getHome().sideList!.then((value) => list.addAll(value));
    await getHome().pastaList!.then((value) => list.addAll(value));
    await getHome().shakeList!.then((value) => list.addAll(value));
    await getHome().staterist!.then((value) => list.addAll(value));
    await getHome().veganList!.then((value) => list.addAll(value));
  return list;
  }
}

class Meal{
  final String id;
  final String name;
  final String imgUrl;
  final bool isFav;


  const Meal({
    required this.id,
    required this.name,
    required this.imgUrl,
   required this.isFav
  
  });

  factory Meal.fromJson(Map<String, dynamic> element) {
    return Meal(
        id: element["idMeal"],
        name: element['strMeal'],
        imgUrl: element['strMealThumb'],
        isFav: false
       );
  }
}

class Meal{
  final String id;
  final String name;
  final String imgUrl;

  const Meal({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  factory Meal.fromJson(Map<String, dynamic> element) {
    return Meal(
        id: element["idMeal"],
        name: element['strMeal'],
        imgUrl: element['strMealThumb']);
  }
}

class Drink{
  final String id;
  final String name;
  final String imgUrl;

  const Drink({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  factory Drink.fromJson(Map<String, dynamic> element) {
    return Drink(
        id: element["idDrink"],
        name: element['strDrink'],
        imgUrl: element['strDrinkThumb']);
  }
}

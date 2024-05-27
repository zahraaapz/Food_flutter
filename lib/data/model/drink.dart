class Drink{
  final String id;
  final String name;
  final String imgUrl;
  final bool isFav;

  const Drink({
    required this.id,
    required this.name,
    required this.imgUrl,
     required this.isFav
  });

  factory Drink.fromJson(Map<String, dynamic> element) {
    return Drink(
        id: element["idDrink"],
        name: element['strDrink'],
        isFav: false,
        imgUrl: element['strDrinkThumb']);
  }
}

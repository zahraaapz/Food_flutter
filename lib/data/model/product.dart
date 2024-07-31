import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class Product {

@HiveField(0)
String imgUrl;
@HiveField(1)
String name;
@HiveField(2)
String id;
@HiveField(3)
bool isFav;


Product({required this.id,required this.imgUrl,required this.name,required this.isFav});


}
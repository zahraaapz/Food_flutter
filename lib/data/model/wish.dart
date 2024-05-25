import 'package:hive/hive.dart';
part 'wish.g.dart';

@HiveType(typeId: 0)
class Wish extends HiveObject{

@HiveField(0)
String imgUrl;
@HiveField(1)
String name;
@HiveField(2)
String id;


Wish({required this.id,required this.imgUrl,required this.name});


}
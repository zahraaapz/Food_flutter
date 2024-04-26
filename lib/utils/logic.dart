
import 'package:rxdart/rxdart.dart';

final imageChaned=BehaviorSubject<String>();

addImage(String base){
  imageChaned.add(base);
}
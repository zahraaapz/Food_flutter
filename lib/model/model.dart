import 'package:dio/dio.dart';

Future<void>getlist()async{
   await  Dio().get(
    'https://pizza-and-desserts.p.rapidapi.com/desserts',
    options: Options(

  headers: {
  
    'X-RapidAPI-Key': 'af8a3477camsh0320259fde0176cp183795jsn74c59430cfa4',
    'X-RapidAPI-Host': 'pizza-and-desserts.p.rapidapi.com'
  })).then((value) {
    print(value.data);
  });
}

  

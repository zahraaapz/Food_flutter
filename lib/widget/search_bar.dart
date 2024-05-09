  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_flutter/screen/detail_product.dart';
import 'package:food_flutter/screen/home/bloc/home_bloc.dart';

import '../component/strings.dart';

TypeAheadField<dynamic> mySearchBar(HomeLoaded state, BuildContext context) {
    return TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: MyStrings.search,
                        prefixIcon: const Icon(CupertinoIcons.search),
                      )),
                      itemBuilder: (context, value) {
                        return  ListTile(title: 
                        Text(value.name)); 
                       
                                          },
                      suggestionsCallback: (search) {
                        return state.list
                            .where((element) => element.name
                                .toLowerCase()
                                .contains(search.toLowerCase()))
                            .toList();
                      },
                      onSuggestionSelected: (suggestion) {
                        final index=state.list.indexOf(suggestion);
                        Navigator.push(context,MaterialPageRoute(builder:(context) => DetailProduct(product:
                        state.list[index], 
                        i:index),));
                      },
                    );
  }
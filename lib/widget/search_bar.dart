import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_flutter/component/strings.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key,this.state});
final state;
  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: MyStrings.search,
                          prefixIcon: const Icon(CupertinoIcons.search),
                        )),
                        itemBuilder: (context, value) {
                          return ListTile(
                            title: Text(value.toString()),
                          );
                        },
                        suggestionsCallback: (search) {
                          return state.list
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(search.toLowerCase()))
                              .toList();
                        },
                        onSuggestionSelected: (suggestion) {},
                      );
  }
}
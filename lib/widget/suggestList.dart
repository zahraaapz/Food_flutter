import 'package:flutter/material.dart';
import 'stack_for_list.dart';

class SuggList extends StatefulWidget {
  const SuggList({super.key, required this.product});
  final Future<List> product;

  @override
  State<SuggList> createState() => _SuggListState();
}

class _SuggListState extends State<SuggList> {
  List list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.product.then((value) => setState(() {
          list = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 360,
        child: list.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return StackForLists(
                    list: list,
                    i: index,
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()));
  }
}


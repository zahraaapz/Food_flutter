import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/component/dim.dart';
import 'package:food_flutter/component/extention.dart';
import 'package:food_flutter/component/text_style.dart';
import 'package:food_flutter/main.dart';
import 'package:food_flutter/screen/home/bloc/home_bloc.dart';
import 'package:food_flutter/screen/main_screen.dart';
import 'package:food_flutter/widget/app_bar.dart';
import 'package:food_flutter/widget/search_bar.dart';
import 'package:food_flutter/widget/prof_box.dart';
import 'package:food_flutter/widget/suggestList.dart';
import 'package:food_flutter/widget/title_box.dart';
import '../../component/color.dart';
import '../../component/strings.dart';

// ignore: must_be_immutable
class ExtrctHome extends StatefulWidget {
  ExtrctHome({
    super.key,
    required this.select,
  });
  int select;

  @override
  State<ExtrctHome> createState() => _ExtrctHomeState();
}

class _ExtrctHomeState extends State<ExtrctHome> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(iHomeRepo);
        homeBloc.add(HomeInit());
        return homeBloc;
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawerScrimColor: const Color.fromARGB(104, 0, 0, 0),
        drawer: drawer(),
        backgroundColor: MyColor.bgColor,
        appBar: const CustomAppBar(childs: SizedBox.shrink()),
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    MyStrings.homeTitle,
                    style: MyStyle.text.copyWith(fontSize: 40),
                  ),
                ),
                Dimens.large.height,
                Center(
                  child: Container(
                      height: 50,
                      width: 314,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30)),
                      child: mySearchBar(state,context)
                                           ),
                ),
                (Dimens.large + 10).height,
                cateList(),
                selectList(context, state),
                selectSuggestList(state),
              ],
            );
          } else {
            return const Center(child: Text('error'));
          }
        }),
      ),
    );
  }



  drawer() {
    return Drawer(
      
      shape: const RoundedRectangleBorder(),
      backgroundColor: MyColor.bgSearchBarColor,
      child: Column(
        children: [
          (Dimens.large + 15).height,
          ProfBox(),
          TiltleBox(title: MyStrings.order),
          TiltleBox(title: MyStrings.pendingReview),
          TiltleBox(title: MyStrings.faq),
          TiltleBox(title: MyStrings.help),
        ],
      ),
    );
  }

  GestureDetector selectList(BuildContext context, HomeLoaded state) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => widget.select == 0
                  ? MainScreen(state.home.pastaList!)
                  : widget.select == 1
                      ? MainScreen(state.home.dessertList!)
                      : widget.select == 2
                          ? MainScreen(state.home.veganList!)
                          : widget.select == 3
                              ? MainScreen(state.home.porkList!)
                              : widget.select == 4
                                  ? MainScreen(state.home.sideList!)
                                  : widget.select == 5
                                      ? MainScreen(state.home.staterist!)
                                      : widget.select == 6
                                          ? MainScreen(state.home.chickenList!)
                                          : widget.select == 7
                                              ? MainScreen(
                                                  state.home.cocoaList!)
                                              : widget.select == 8
                                                  ? MainScreen(
                                                      state.home.shakeList!)
                                                  : MainScreen(state
                                                      .home.cocktailList!))),
      child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 18),
            child: Text(
              MyStrings.seeMore,
              style: MyStyle.orangeBtnText
                  .copyWith(color: MyColor.TextColorOrange),
            ),
          )),
    );
  }

  IndexedStack selectSuggestList(HomeLoaded state) {
    return IndexedStack(index: widget.select, children: [
      SuggList(
        product: state.home.pastaList!,
      ),
      SuggList(
        product: state.home.dessertList!,
      ),
      SuggList(
        product: state.home.veganList!,
      ),
      SuggList(
        product: state.home.porkList!,
      ),
      SuggList(
        product: state.home.sideList!,
      ),
      SuggList(
        product: state.home.staterist!,
      ),
      SuggList(
        product: state.home.chickenList!,
      ),
      SuggList(
        product: state.home.cocoaList!,
      ),
      SuggList(
        product: state.home.shakeList!,
      ),
      SuggList(
        product: state.home.cocktailList!,
      ),
    ]);
  }

  SizedBox cateList() {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: MyStrings.cate.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.select = index;
              });
            },
            child: Text(
              MyStrings.cate[index],
              style:
                  index != widget.select ? MyStyle.text : MyStyle.whiteBtnText,
            ),
          ),
        ),
      ),
    );
  }
}

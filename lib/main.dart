import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_flutter/data/repo/home_repo.dart';
import 'package:food_flutter/data/src/home_data_src.dart';
import 'package:food_flutter/screen/cart/bloc/cart_bloc.dart';
import 'package:food_flutter/screen/home/home_screen.dart';
import 'package:food_flutter/screen/register/cubit/auth_cubit.dart';
import 'package:food_flutter/screen/splash_screen.dart';
import 'component/api_key.dart';
import 'utils/sharedPre_mng.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();

  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject(projectId)
      .setSelfSigned();

  Account users = Account(client);
  runApp(MyApp(account: users));
  await SharedPreferencesMannager().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.account});
  final account;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          final bloc = CartBloc();
          bloc.add(CartEventInit());
          return bloc;
        }),
       BlocProvider(
        create: (context) => AuthCubit(account),
       ) 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'sf'),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is SentEmail) {
              return HomeScreen();
            } else {
              return SplashScreen();
            }
          },
        ),
        // routes: route,
        // initialRoute: RouteName.root,
      ),
    );
  }
}

IHomeRepo iHomeRepo = HomeRepository(HomeRemoteDataSrc(Dio()));

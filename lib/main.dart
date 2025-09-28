import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:foodapp/Pages/StartPage/UI/startpage.dart";
import "package:foodapp/Pages/CartPage/bloc/cartpage_bloc.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartpageBloc(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: StartPage(),
      ),
    );
  }
}

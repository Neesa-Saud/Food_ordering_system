import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:foodapp/Pages/OrdersPage/bloc/orderpage_bloc.dart";
import "package:foodapp/Pages/StartPage/UI/startpage.dart";
import "package:foodapp/Pages/CartPage/bloc/cartpage_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartpageBloc>(
          create: (context) => CartpageBloc(),
        ),
        BlocProvider<OrderpageBloc>(
          create: (context) => OrderpageBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: const StartPage(),
      ),
    );
  }
}

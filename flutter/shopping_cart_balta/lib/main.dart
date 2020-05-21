import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/blocs/cart_bloc.dart';
import 'package:shoppingcartbalta/ui/android/pages/tabs_page.dart';
import 'package:shoppingcartbalta/blocs/home_bloc.dart';
import 'package:shoppingcartbalta/blocs/theme_bloc.dart';
import 'package:shoppingcartbalta/blocs/user_bloc.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( //manter o estado da aplicação, como o item no carrinho
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
        ChangeNotifierProvider<UsuarioBloc>.value(
          value: UsuarioBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: Main(),
    );
  }

}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

  return MaterialApp(
    title: 'Shopping cart',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: DefaultTabController(
      length: 3,
      child: TabsPage(),
    ),
  );


  }
}


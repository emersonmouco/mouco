import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartbalta/blocs/cart_bloc.dart';
import 'package:shoppingcartbalta/ui/android/pages/cart_page.dart';
import 'package:shoppingcartbalta/ui/android/pages/home_page.dart';
import 'package:shoppingcartbalta/ui/android/pages/account_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          CartPage(),
          AccountPage(),
        ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                      bloc.cart.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ),
                ],
                ),
            ),
            Tab(
              icon: new Icon(Icons.perm_identity),
            ),
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.black38,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5),
          indicatorColor: Theme.of(context).primaryColor,
          ),
    );
  }
}
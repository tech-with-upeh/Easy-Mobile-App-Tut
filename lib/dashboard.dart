import 'package:easyapp/dashboard/cart.dart';
import 'package:easyapp/dashboard/dashhome.dart';
import 'package:easyapp/dashboard/more.dart';
import 'package:easyapp/dashboard/orders.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/ph.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: DashHome(),
          item: ItemConfig(
            icon: Iconify(Ph.house_fill, color: Colors.white),
            inactiveIcon: Iconify(Ph.house_thin, color: Colors.white70),
            title: "Home",
            activeForegroundColor: Colors.white,
          ),
        ),

        PersistentTabConfig(
          screen: OrdersPage(),
          item: ItemConfig(
            icon: Iconify(Ph.storefront_fill, color: Colors.white),
            title: "Order",
            inactiveIcon: Iconify(Ph.storefront_thin, color: Colors.white70),
            activeForegroundColor: Colors.white,
          ),
        ),

        PersistentTabConfig(
          screen: CartPage(),
          item: ItemConfig(
            icon: Iconify(Ph.shopping_cart_fill, color: Colors.white),
            title: "Cart",
            inactiveIcon: Iconify(Ph.shopping_cart_thin, color: Colors.white70),
            activeForegroundColor: Colors.white,
          ),
        ),

        PersistentTabConfig(
          screen: MorePage(),
          item: ItemConfig(
            icon: Iconify(Ph.squares_four_fill, color: Colors.white),
            title: "More",
            inactiveIcon: Iconify(Ph.squares_four_thin, color: Colors.white70),
            activeForegroundColor: Colors.white,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Color.fromRGBO(2, 6, 22, 1),
          padding: EdgeInsets.only(bottom: 22),
        ),
      ),
    );
  }
}

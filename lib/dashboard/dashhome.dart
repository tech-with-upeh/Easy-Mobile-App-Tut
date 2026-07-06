// ignore_for_file: prefer_final_fields

import 'package:easyapp/appprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class DashHome extends StatefulWidget {
  const DashHome({super.key});

  @override
  State<DashHome> createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  int _selectedTab = 0;

  // final Map<String, String>
  //{"Apple": [apple.png, $7, 40Cal]}

  @override
  Widget build(BuildContext context) {
    final List<CartItem> _gridItems = [
      CartItem(
        id: '1',
        name: 'Pineapple',
        price: 15.0,
        calories: 80,
        imageUrl: 'assets/pineapple.png',
      ),
      CartItem(
        id: '2',
        name: 'Banana',
        price: 10.0,
        calories: 59,
        imageUrl: 'assets/banana.png',
      ),
      CartItem(
        id: '3',
        name: 'Tangerine',
        price: 7.0,
        calories: 35,
        imageUrl: 'assets/tangerine.png',
      ),
      CartItem(
        id: '4',
        name: 'PawPaw',
        price: 21.0,
        calories: 25,
        imageUrl: 'assets/pawpaw.png',
      ),
      CartItem(
        id: '5',
        name: 'Pineapple 2',
        price: 15.0,
        calories: 80,
        imageUrl: 'assets/pineapple.png',
      ),
      CartItem(
        id: '6',
        name: 'Banana 2',
        price: 10.0,
        calories: 59,
        imageUrl: 'assets/banana.png',
      ),
      CartItem(
        id: '7',
        name: 'Tangerine 2',
        price: 7.0,
        calories: 35,
        imageUrl: 'assets/tangerine.png',
      ),
      CartItem(
        id: '8',
        name: 'PawPaw 2',
        price: 21.0,
        calories: 25,
        imageUrl: 'assets/pawpaw.png',
      ),
      CartItem(
        id: '9',
        name: 'Pineapple 3',
        price: 15.0,
        calories: 80,
        imageUrl: 'assets/pineapple.png',
      ),
      CartItem(
        id: '10',
        name: 'Banana 3',
        price: 10.0,
        calories: 59,
        imageUrl: 'assets/banana.png',
      ),
      CartItem(
        id: '11',
        name: 'Tangerine 3',
        price: 7.0,
        calories: 35,
        imageUrl: 'assets/tangerine.png',
      ),
      CartItem(
        id: '12',
        name: 'PawPaw 3',
        price: 21.0,
        calories: 25,
        imageUrl: 'assets/pawpaw.png',
      ),
    ];

    final List<String> _horizontalSlider = [
      "Fruits",
      "Fast-Food",
      "Vegetables",
      "Dairy",
      "Wines",
      "Cakes",
      "Confectionaries",
    ];

    final List<String> _gridImages = [
      'assets/pineapple.png',
      'assets/banana.png',
      'assets/tangerine.png',
      'assets/pawpaw.png',
      'assets/pineapple.png',
      'assets/banana.png',
      'assets/tangerine.png',
      'assets/pawpaw.png',
      'assets/pineapple.png',
      'assets/banana.png',
      'assets/tangerine.png',
      'assets/pawpaw.png',
    ];

    //TODO: Fetch from Api
    Map<String, List<String>> _gridmap = {
      "Pineapple": ['assets/pineapple.png', '\$15', "80Cal"],
      "Banana": ['assets/banana.png', '\$10', "59Cal"],
      "Tangerine": ['assets/tangerine.png', '\$7', "35Cal"],
      "PawPaw": ['assets/pawpaw.png', '\$21', "25Cal"],
      "Pineapple 1": ['assets/pineapple.png', '\$15', "80Cal"],
      "Banana 2": ['assets/banana.png', '\$10', "59Cal"],
      "Tangerine 2": ['assets/tangerine.png', '\$7', "35Cal"],
      "PawPaw 2": ['assets/pawpaw.png', '\$21', "25Cal"],
      "Pineapple 3": ['assets/pineapple.png', '\$15', "80Cal"],
      "Banana 3": ['assets/banana.png', '\$10', "59Cal"],
      "Tangerine 3": ['assets/tangerine.png', '\$7', "35Cal"],
      "PawPaw 3": ['assets/pawpaw.png', '\$21', "25Cal"],
    };

    var _gridkeys = _gridmap.keys.toList();

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(2, 6, 22, 1),
          body: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: 36,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daily\nGrocery Food",
                          style: GoogleFonts.lato(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: const Color.fromRGBO(2, 6, 22, 1),
                            height: 1.2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Iconify(Ph.magnifying_glass, size: 28),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: SizedBox(
                        height: 48,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _horizontalSlider.length,
                          itemBuilder: (context, index) {
                            final isSelected = index == _selectedTab;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedTab = index;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color.fromRGBO(2, 6, 22, 1)
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  _horizontalSlider[index],
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.blueGrey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 36,
                        left: 4,
                        right: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Popular Fruits",
                            style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "See All",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _gridItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16, //gap
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.85,
                              mainAxisExtent: 250,
                            ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 250 * 0.55,

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      _gridItems[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 4,
                                    children: [
                                      Text(
                                        _gridItems[index].name,
                                        style: GoogleFonts.lato(
                                          letterSpacing: 1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        _gridItems[index].calories.toString() +
                                            " Cal",
                                        style: GoogleFonts.lato(fontSize: 16),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                _gridItems[index].price
                                                    .toString(),
                                                style: GoogleFonts.lato(
                                                  fontSize: 18,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.deepOrange,
                                                ),
                                              ),

                                              // "/Kg"
                                              Text(
                                                "/Kg",
                                                style: GoogleFonts.lato(
                                                  fontSize: 18,
                                                  //fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              cartProvider.addCartItem(
                                                _gridItems[index],
                                              );
                                              print(
                                                "Cart Items: ${cartProvider.cartItems}",
                                              );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: Colors.deepOrange,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Iconify(
                                                Ph.plus_bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

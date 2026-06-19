import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/ph.dart';

class DashHome extends StatefulWidget {
  const DashHome({super.key});

  @override
  State<DashHome> createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  int _SelectedTab = 0;

  @override
  Widget build(BuildContext context) {
    List<String> horizontal_slider = [
      "Fruits",
      "Fast-Food",
      "Vegetables",
      "Dairy",
      "Wines",
      "Cakes",
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 6, 22, 1),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.90,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily\n"
                          "Grocery Food",
                          style: GoogleFonts.lato(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(2, 6, 22, 1),
                          ),
                        ),

                        //Icon(Icons.search_rounded),
                        Iconify(Ph.magnifying_glass),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 48),
                          child: SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: horizontal_slider.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _SelectedTab = index;
                                    });
                                  },
                                  child: Container(
                                    height: 48,
                                    width: 100,
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: (index == _SelectedTab)
                                          ? Color.fromRGBO(2, 6, 22, 1)
                                          : Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Center(
                                      child: Text(
                                        horizontal_slider[index],
                                        style: GoogleFonts.lato(
                                          color: (index == _SelectedTab)
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: sort_child_properties_last

import 'package:easyapp/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int _currentPage = 0;

  final List<String> img = const [
    'assets/pineapple.png',
    'assets/banana.png',
    'assets/tangerine.png',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // double --
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        //OOP --> OBJECT ORIENTED PROGRAMMING
        backgroundColor: Color.fromRGBO(2, 6, 22, 1),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.6,
              width: double.infinity,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(img[index]),
                        height: height * 0.6,
                        width: double.infinity,
                      ),
                    ),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    height: 8,
                    width: (index == _currentPage) ? 30 : 8,
                    margin: const EdgeInsets.only(top: 20, left: 2, right: 2),
                    decoration: BoxDecoration(
                      color: (index == _currentPage)
                          ? Colors.white
                          : Colors.grey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Welcome To Grocery Shop",
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Embark on a culinery journey with \n"
                  "fresh ingredients brought\n"
                  "right to your kitchen.",
                  style: GoogleFonts.lato(fontSize: 20, color: Colors.white70),
                  textAlign: .center,
                  overflow: .clip,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}

// stateless & stateful
// Scaffold, Text, Container, Padding, SizeBox, Column, Row, Stack

// AnnotatedRegion

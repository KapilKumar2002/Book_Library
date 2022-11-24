import 'package:book_library/constant.dart';
import 'package:book_library/pages/DonateBooks.dart';
import 'package:book_library/pages/Getbooks.dart';
import 'package:book_library/pages/Home_Screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _ourpages = [HomeScreen(), DonateBook(), GetBook()];
  var myindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mCard,
        body: Center(
          child: _ourpages[myindex],
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: ((index) {
                  setState(() {
                    myindex = index;
                  });
                }),
                currentIndex: myindex,
                backgroundColor: mCard,
                fixedColor: Colors.black,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'Donate',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book_outlined),
                    label: 'Get',
                  ),
                ],
              ),
            )));
  }
}

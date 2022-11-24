import 'package:book_library/constant.dart';
import 'package:book_library/pages/Aboutpage.dart';
import 'package:book_library/pages/DonateBooks.dart';
import 'package:book_library/pages/Donationpage.dart';
import 'package:book_library/pages/DrawerWiget.dart';
import 'package:book_library/pages/Getbooks.dart';
import 'package:book_library/pages/Help.dart';
import 'package:book_library/pages/SignUp.dart';
import 'package:book_library/services/Auth_service.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  String? name;
  HomeScreen({this.name});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthClass authClass = AuthClass();

  late ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawers(),
      appBar: AppBar(
          backgroundColor: mBackgroundColor,
          title: "Book Space".text.xl4.bold.black.make().shimmer(
                primaryColor: Vx.blue500,
                secondaryColor: Vx.purple500,
              ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await authClass.logout();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => SignUpPage()),
                      (route) => false);
                }),
          ],
          // backgroundColor: Colors.transparent,
          elevation: 0.2,
          centerTitle: true),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: mBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: MediaQuery.of(context).size.height / 1.5,
              margin: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image(
                    image: AssetImage("images/Logo_Bg.png"),
                    height: 250,
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Welcome To The Book_Space",
                    style: GoogleFonts.roboto(
                      color: mCard,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Get Your Own Reading",
                    style: GoogleFonts.roboto(
                      color: mCard,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const AboutPage()));
                    },
                    child: Text(
                      "Know More...",
                      style: GoogleFonts.radioCanada(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: mBackgroundColor2, // background (button) color
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => DonateBook()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: mCard,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: MediaQuery.of(context).size.height + 120,
                margin: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Donate Books",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: mBackgroundColor,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Image(
                      image: AssetImage("images/book2.gif"),
                      height: 400,
                      width: MediaQuery.of(context).size.width - 30,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Icon(
                      Icons.format_quote,
                      size: 50,
                      color: mbutton,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "If you want to donate or give books to others then click on this and fill the form and give some information. ThankYou !!",
                          style: GoogleFonts.alice(
                            color: Colors.black,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => const GetBook()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: mCard,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: MediaQuery.of(context).size.height + 70,
                margin: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Get Books",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: mBackgroundColor,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Image(
                      image: AssetImage("images/Book3.gif"),
                      height: 200,
                      width: MediaQuery.of(context).size.width - 50,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Icon(
                      Icons.format_quote,
                      size: 50,
                      color: mbutton,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "If you want to donate or give books to others then click on this and fill the form and give some information. ThankYou !!",
                        style: GoogleFonts.alice(
                          color: Colors.black,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

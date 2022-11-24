import 'package:book_library/constant.dart';
import 'package:book_library/pages/DonateBooks.dart';
import 'package:book_library/pages/DrawerWiget.dart';
import 'package:book_library/pages/Getbooks.dart';
import 'package:book_library/pages/Home_Screen.dart';
import 'package:book_library/pages/SignUp.dart';
import 'package:book_library/services/Auth_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              height: MediaQuery.of(context).size.height * 2,
              margin: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("images/Logo_Bg.png"),
                      height: 250,
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Book_Space is an organization that provide books to some needy peoples in Free of Cost. The main idea of this organization is to help the peoples near about ourself. In this organization two platforms are available one for DONATE BOOK and another one for GET BOOK. In Donate book platform user can give book that is useless for him hoping that this book helps for others. In Get Book platform users can see diffrent books available and if user want any book the phone number and address of owner seeing user can directly contact with the owner and get book.",
                      style: GoogleFonts.alice(
                          fontSize: 20,
                          color: mCard,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Note:                                                                              ",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.orange),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "(i) If owner is too far then he will courrier the books at your place but courrier charges paid by those who want book. ",
                      style: GoogleFonts.alice(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "(ii) If any case user did not contact the owner then it will go to the contact section admin contacts and emails id shown user can contact us and also user can fill one form in same contact page in which it will give Book_Space_id which book he/she want.",
                      style: GoogleFonts.alice(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: mCard,
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Our Team Members",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Image(
                  //   image: AssetImage("assets/anshu.jpg"),
                  //   height: 450,
                  //   width: 500,
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  Text(
                    "Mr. Vishal Virdi\nMr. Kapil Kumar \nMr. Vishal Chandral",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: mBackgroundColor,
                        fontSize: 24),
                  ),
                  Icon(
                    Icons.format_quote,
                    size: 50,
                    color: mbutton,
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "The main objective of creating this organization is to helping students in daily life. You can easily find or donate books through this organization. The main feature of this organization is we provide books free of cost. ThankYou!!",
                      style: GoogleFonts.alice(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
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

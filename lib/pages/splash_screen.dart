import 'package:book_library/constant.dart';
import 'package:book_library/pages/SignUp.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var d = Duration(seconds: 2);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return SignUpPage();
      }), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: Container(
        child: Center(
          child: Image(
            image: AssetImage('images/Logo_Bg.png'),
          ),
        ),
      ),
    );
  }
}

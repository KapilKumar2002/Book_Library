import 'package:book_library/constant.dart';
import 'package:book_library/pages/DrawerWiget.dart';
import 'package:book_library/pages/SignUp.dart';
import 'package:book_library/services/Auth_service.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'SignInPage.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  AuthClass authClass = AuthClass();
  SignInPage signInPage = SignInPage();
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  void handlerPaymentSuccess() {
    print("Payment Success");
  }

  void handlerErrorFailure() {
    print("Payment Failure");
  }

  void handlerExternalWallet() {
    print("External Payment");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_1Vc0PuqcVPrFw3",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Kapil Kumar",
      "description": "Donation for Book_Space",
      "prefill": {
        "contact": "8445589271",
        "email": "kapil012002@gmail.com",
      },
      "external": {
        "wallet": ["paytm"]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mCard,
      drawer: Drawers(),
      appBar: AppBar(
          backgroundColor: mBackgroundColor,
          title: "Donation".text.xl4.bold.black.make().shimmer(
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Image(
                image: AssetImage("images/Logo_Bg.png"),
                height: 200,
                width: 200,
              )),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Amount to Donate",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  openCheckout();
                },
                child: Text(
                  "Donate Now",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // child: mBackgroundColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

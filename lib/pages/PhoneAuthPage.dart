import 'dart:async';

import 'package:book_library/constant.dart';
import 'package:book_library/services/Auth_service.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  int start = 30;
  bool wait = false;
  String buttonName = 'Send';
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = '';
  String smsCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        backgroundColor: mCard,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              textField(),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Enter 6 Digit OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              otpField(),
              SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Send Otp again in ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "00:$start",
                    style: TextStyle(
                      color: mCard,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                TextSpan(
                    text: " sec",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ])),
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  authClass.SignInWithPhoneNumber(
                      verificationIdFinal, smsCode, context);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff3120E0),
                        Color(0xff386fa4),
                        Color(0xff3120E0),
                      ]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Lets Go",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 50,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: mCard,
        borderColor: mCard,
      ),
      style: TextStyle(
        fontSize: 17,
        color: Colors.white,
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  Widget textField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration:
          BoxDecoration(color: mCard, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: phoneController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Your Phone Number",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
              child: Text(
                "+91",
                style: TextStyle(
                    color: mbutton, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            suffixIcon: InkWell(
              onTap: wait
                  ? null
                  : () async {
                      startTimer();
                      setState(() {
                        start = 30;
                        wait = true;
                        buttonName = "Resend";
                      });
                      await authClass.verifyPhoneNumber(
                          "+91 ${phoneController.text}", context, setData);
                    },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Text(
                  buttonName,
                  style: TextStyle(
                    color: wait ? Colors.white : mbutton,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
      ),
    );
  }

  void setData(verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}

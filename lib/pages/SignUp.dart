import 'package:book_library/constant.dart';
import 'package:book_library/pages/SignInPage.dart';
import 'package:book_library/services/Auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userid = TextEditingController();
  TextEditingController _cnfpasswordController = TextEditingController();
  bool circular = false;
  String uid = '';
  AuthClass authClass = AuthClass();

  void adddata() async {
    FirebaseFirestore.instance.collection("users").add({
      "userid": uid,
      "email": _emailController,
      "password": _passwordController,
      "name": _usernameController,
    });
    print("User Added");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: mBackgroundColor,
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 30.0,
              // ),
              // Text(
              //   "Sign Up",
              //   style: TextStyle(
              //     fontSize: 35,
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(
              //   height: 30.0,
              // ),
              textItem("User Name", _usernameController, false,
                  FontAwesomeIcons.user),
              SizedBox(
                height: 15.0,
              ),
              textItem(
                  "Email", _emailController, false, FontAwesomeIcons.envelope),
              SizedBox(
                height: 15.0,
              ),
              textItem(
                  "Password", _passwordController, true, FontAwesomeIcons.lock),
              SizedBox(
                height: 15.0,
              ),
              textItem("Confirm Password", _cnfpasswordController, true,
                  FontAwesomeIcons.lock),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Or",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),

              SizedBox(
                height: 30.0,
              ),
              ColorButton(),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If You already have an account?  ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => SignInPage()),
                          (route) => false);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ColorButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        // print(_passwordController.text);
        try {
          if (_passwordController.text != _cnfpasswordController.text) {
            setState(() {
              circular = false;
            });
            final snackbar = SnackBar(
                content: Text("Password and Confrim Password not match"));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          } else {
            firebase_auth.UserCredential userCredential =
                await firebaseAuth.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text);
            print(userCredential.user?.email);
            uid = userCredential.user!.uid;
            adddata();
            setState(() {
              circular = false;
            });
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (builder) =>
                        SignInPage(name: _usernameController.text)),
                (route) => false);
          }
        } catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Color(0xff3120E0),
              Color(0xff386fa4),
              Color(0xff3120E0),
            ])),
        child: Center(
          child: circular
              ? CircularProgressIndicator()
              : Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }

  Widget buttonItem(IconData icons, String text, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 50,
        child: Card(
          color: mCard,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 1,
              color: Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                size: 30,
                color: mbutton,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(String labletxt, TextEditingController controller,
      bool obscureText, IconData icons) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 15), // add padding to adjust icon
              child: Icon(
                icons,
                color: mCard,
              ),
            ),
            labelText: labletxt,
            labelStyle: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: mCard,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ))),
      ),
    );
  }
}

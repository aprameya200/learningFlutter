// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningdart/utils/routes.dart';

///Stateless vs Stateful widgwt
///
///Stateless:
///Widget renders page that does not have any changig elemets
///
///Stateful:
///Widget that renders page that has changing properties or that allows changes

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// var names with no _ in front = public
/// var name with _ (underscore) in front = private

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            //allows for scrool functionlity
            child: Column(children: [
          //inside this children list
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
//
            // style: GoogleFonts.aladin(color: Colors.black, fontSize: 40),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                  onChanged: (value) {
                    //run this function on change
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),

//option to wrap with gesture detector or inkWEll for click functionality or inkWEll
          InkWell(
            onTap: () async {
              setState(() {
                changedButton = true;
              });

              await Future.delayed(Duration(seconds: 1));
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            child: AnimatedContainer(
              width: changedButton ? 50 : 150,
              height: 50,
              decoration: BoxDecoration(
                  // cannot use both color (of container and color of box decoration)
                  color: Colors.deepPurple,
                  // shape: changedButton ? BoxShape.circle : BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(changedButton ? 50 : 8)),
              duration: Duration(seconds: 1),
              child: Center(
                //can use wrap with center
                child: changedButton
                    ? Icon(Icons.done, color: Colors.white) //if btn is clicked
                    : Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
              ),
            ),
          )
          // ElevatedButton(
          //   // to add button
          //   //ButtonStyle not needed in elecvatred button
          //   style: ButtonStyle(
          //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          //     backgroundColor:
          //         MaterialStateProperty.all<Color>(Colors.deepPurple),
          //     minimumSize: MaterialStateProperty.all<Size>(Size(150, 40)),
          //   ),
          //   onPressed: () {
          //     Navigator.pushNamed(
          //         context,
          //         MyRoutes
          //             .homeRoute); //goes to specified reoute while btn is pressed
          //   }, //method call;
          //   child: Text('Login', style: TextStyle(fontSize: 17.5)),
          //   //style: TextButton.styleFrom(minimumSize: Size(150, 40)),
          // ),
        ])));
  }
}

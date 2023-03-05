import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorHome.dart';
import 'package:uoc_counselor/screens/signup.dart';
import 'package:uoc_counselor/screens/studentHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  void signInUser() async {
    String email = emailController.text;
    String password = pwController.text;


    if (email.isNotEmpty && EmailValidator.validate(email) &&
        password.isNotEmpty) {
      try {
        // Retrieve user data from Firestore
        QuerySnapshot coun = await FirebaseFirestore.instance
            .collection('counselors')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

        QuerySnapshot stu = await FirebaseFirestore.instance
            .collection('students')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

        if (coun.docs.isNotEmpty) {
          // Check if password matches
          Map<String, dynamic> userData = coun.docs.first
              .data() as Map<String, dynamic>;
          if (userData != null) {
            String hashedPassword = userData['password'] ?? "";
            print(hashedPassword);

            if (hashedPassword == password) {
              // print('true');
              // Redirect user to appropriate screen
              String userType = userData['index'];
              print(userType);
              if (userType.startsWith('U')) {
                // print('hi');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudentHome()),
                );
              } else {
                print('hola');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CounselorHome()),
                );
              }
            }
          }
        }
        if (stu.docs.isNotEmpty) {
          // Check if password matches
          Map<String, dynamic> userData = stu.docs.first
              .data() as Map<String, dynamic>;
          if (userData != null) {
            String hashedPassword = userData['password'] ?? "";
            print(hashedPassword);

            if (hashedPassword == password) {
              // Redirect user to appropriate screen
              String userType = userData['index'];
              print(userType);
              if (userType.startsWith('S')) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudentHome()),
                );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CounselorHome()),
                );
              }
            }
          }
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign-in',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have Account?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Sign-Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => signup()),
                          );
                        },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 300.0,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Email',
                      labelText: 'Email Address',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: pwController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: () {
                    signInUser();
                  },
                  child: Text('Sign In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


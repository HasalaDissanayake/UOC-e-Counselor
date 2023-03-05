import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();

  void registerUser() {
    String name = nameController.text;
    String email = emailController.text;
    String mobileNo = mobileNoController.text;
    String index = indexController.text;
    String password = pwController.text;
    String vrypassword = confirmPwController.text;

    if (email.isNotEmpty && EmailValidator.validate(email) && name.isNotEmpty &&
        mobileNo.isNotEmpty && index.isNotEmpty && password.isNotEmpty &&
        vrypassword.isNotEmpty) {
      if ((password.length >= 6) && (vrypassword == password)){

        String collectionName = index.startsWith('S') ? 'counselors' : 'students';
        DocumentReference newUser = FirebaseFirestore.instance.collection(
            collectionName).doc();

      newUser.set({
        'name': name,
        'email': email,
        'mobileNo': mobileNo,
        'index': index,
        'password': password
      });
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => signin()),
        );
    }
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color:Colors.deepPurple,
        child: ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign-Up',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                                text:'Sign-In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap= (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => signin()),
                                    );
                                  }
                            ),
                          ),
                        ],
                      ),
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
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Name',
                            labelText: 'Name',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: mobileNoController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Phone No',
                            labelText: 'Phone No',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: indexController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter ID No',
                            labelText: 'ID No',
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
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: TextFormField(
                          obscureText: true,
                          controller: confirmPwController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Re-type Password',
                            labelText: 'Re-type Password',
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: (){
                            registerUser();
                        },
                        child: Text('Sign In'),
                      ),
                    )
                  ],
                ),
              ),
            ]
        ),
      ) ,
    );
  }
}

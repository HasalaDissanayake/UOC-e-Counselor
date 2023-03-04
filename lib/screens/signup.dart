import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/signin.dart';

class signup  extends StatelessWidget {


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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Index No',
                            labelText: 'Index No',
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

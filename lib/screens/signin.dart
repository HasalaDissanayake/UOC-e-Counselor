import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorHome.dart';
import 'package:uoc_counselor/screens/studentHome.dart';

class signin  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color:Colors.deepPurple,
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
                          text:'Sign-Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap= (){
                              print('Link tapped!');
                            }
                      )
                    //   'SignUp',
                    // style: TextStyle(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.white,
                    // ),

                  ),
                ],

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
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return CounselorHome();
                        }
                    ));
                  },
                  child: Text('Sign In'),
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}

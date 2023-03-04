import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/signin.dart';
import 'package:uoc_counselor/screens/signup.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'UOC e-Counselor ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.medical_services,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      height: 40.0,
                      width: 350.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context){
                                return signin();
                              }
                          ));
                        },
                        child: Text('Sign In'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      height: 40.0,
                      width: 350.0,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.white),
                        ),
                        onPressed: () {
                          // TODO: Add register button logic
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context){
                                return signup();
                              }
                          ));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
}

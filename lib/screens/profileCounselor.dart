import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorHome.dart';
import 'package:uoc_counselor/screens/counselorMessage.dart';
import 'package:uoc_counselor/screens/counselorNotifications.dart';
import 'package:uoc_counselor/screens/signin.dart';

class ProfileCounselor extends StatefulWidget {
  const ProfileCounselor({Key? key}) : super(key: key);

  @override
  State<ProfileCounselor> createState() => _ProfileCounselorState();
}

class _ProfileCounselorState extends State<ProfileCounselor> {
  final _myController = TextEditingController(text: 'Default Value');

  int _currentIndex = 3;

  final List<Widget> _children = [
    CounselorHome(),
    CounselorMessage(),
    CounselorNotification(),
    ProfileCounselor(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white30,
        child: Scrollbar(
          child: ListView(
              children: [
                Column(
                  children: [
                    ListTile(
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10.0,bottom: 40),
                        child: CircleAvatar(
                          backgroundColor:Colors.red,
                          radius: 50.0,

                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: SizedBox(
                        width: 300.0,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: TextEditingController(text: 'Default Value1'),

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Password',
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: SizedBox(
                        width: 300.0,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: TextEditingController(text: 'Default Value2'),

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Password',
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: SizedBox(
                        width: 300.0,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: TextEditingController(text: 'Default Value3'),

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Password',
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: SizedBox(
                        width: 300.0,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: TextEditingController(text: 'Default Value'),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Password',
                              labelText: 'Passweeord',
                            ),
                          ),
                        ),
                      ),
                    ),

                    ListTile(
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 20.00),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 100.0,
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => signin()),
                                  );
                                },
                                child: Text('Log Out'),
                              ),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: ElevatedButton(
                                onPressed: (){

                                },
                                child: Text('Edit'),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]

          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: Tapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.notifications_active),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
  void Tapped(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 0) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorHome()),
        );
      } else if (index == 2) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorNotification()),
        );
      } else if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorMessage()),
        );
      }
    });
  }
}

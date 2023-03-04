import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorMessage.dart';
import 'package:uoc_counselor/screens/counselorNotifications.dart';
import 'package:uoc_counselor/screens/profileCounselor.dart';

class CounselorHome extends StatefulWidget {
  const CounselorHome({Key? key}) : super(key: key);

  @override
  State<CounselorHome> createState() => _CounselorHomeState();
}

class _CounselorHomeState extends State<CounselorHome> {

  int _currentIndex = 0;

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
        backgroundColor: Colors.deepPurple,
        title: Text('My Appointments'),
      ),
      body: Container(
          width: double.infinity,
          color: Colors.black12,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  subtitle: Padding(
                    padding: EdgeInsets.all(5.00),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Date:',style: TextStyle(
                                fontSize: 20.0,
                              ),
                              ),
                              Text('2023/04/1:',style: TextStyle(
                                fontSize: 20.0,
                              ),
                              ),
                            ],

                          ),
                          Row(
                            children: [
                              Text('Time:',style: TextStyle(
                                fontSize: 20.0,
                              ),
                              ),
                              Text('5.00pm:',style: TextStyle(
                                fontSize: 20.0,
                              ),
                              ),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                  trailing: SizedBox(
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: (){

                      },
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set background color
                      ),

                    ),
                  )
              );
            },
          )
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

      if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorMessage()),
        );
      } else if (index == 2) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorNotification()),
        );
      } else if (index == 3) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileCounselor()),
        );
      }
    });
  }
}
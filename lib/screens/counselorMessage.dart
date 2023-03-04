import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorHome.dart';
import 'package:uoc_counselor/screens/counselorMessageOne.dart';
import 'package:uoc_counselor/screens/counselorNotifications.dart';
import 'package:uoc_counselor/screens/profileCounselor.dart';

class CounselorMessage extends StatefulWidget {
  const CounselorMessage({Key? key}) : super(key: key);

  @override
  State<CounselorMessage> createState() => _CounselorMessageState();
}

class _CounselorMessageState extends State<CounselorMessage> {
  final List<String> names = [
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
  ];

  final List<String> details = [
    'Hello What are your updates',
    'Hello What are your updates',
    'Hello What are your updates',
    'Hello What are your updates',
    'Hello What are your updates',
    'Hello What are your updates',
  ];

  int _currentIndex = 1;

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
        title: Text('Messages'),
        backgroundColor: Colors.deepPurple,
      ) ,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Expanded(
                    child: Image.asset(
                      'assets/man.jpg',
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(names[index]),
                  subtitle: Text(details[index]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CounselorMeassageOne()),
                    );
                  },
                );
              },
            ),
          ),
        ],
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
      } else if (index == 3) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileCounselor()),
        );
      }
    });
  }
}

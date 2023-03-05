import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorHome.dart';
import 'package:uoc_counselor/screens/counselorMessage.dart';
import 'package:uoc_counselor/screens/profileCounselor.dart';

class CounselorNotification extends StatefulWidget {
  const CounselorNotification({Key? key}) : super(key: key);

  @override
  State<CounselorNotification> createState() => _CounselorNotificationState();
}

class _CounselorNotificationState extends State<CounselorNotification> {
  final List<String> names = [
    'Meeting Reminder',
    'Received Message',
    'Meeting Reminder',
    'Received Message',
    'Meeting Reminder',
    'Received Message',
  ];

  int _currentIndex = 2;

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
        title: Text('Notifications'),
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
                  onTap: () {
                    // Do something when the list tile is tapped
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
      } else if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorMessage()),
        );
      } else if (index == 3) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileCounselor()),
        );
      }
    });
  }
}

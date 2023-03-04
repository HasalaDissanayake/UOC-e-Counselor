import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/studentmessages.dart';
import 'package:uoc_counselor/screens/profileStudent.dart';
import 'package:uoc_counselor/screens/studentHome.dart';

class StudentNotifications extends StatefulWidget {
  const StudentNotifications({Key? key}) : super(key: key);

  @override
  State<StudentNotifications> createState() => _StudentNotificationsState();
}

class _StudentNotificationsState extends State<StudentNotifications> {

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
    StudentHome(),
    StudentMessages(),
    StudentNotifications(),
    ProfileStudent(),
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
          MaterialPageRoute(builder: (context) => StudentHome()),
        );
      } else if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => StudentMessages()),
        );
      } else if (index == 3) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileStudent()),
        );
      }
    });
  }
}
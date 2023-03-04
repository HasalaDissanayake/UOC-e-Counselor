import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/studentMessageOne.dart';
import 'package:uoc_counselor/screens/studentnotifications.dart';
import 'package:uoc_counselor/screens/profileStudent.dart';
import 'package:uoc_counselor/screens/searchcounselor.dart';
import 'package:uoc_counselor/screens/studentHome.dart';

class StudentMessages extends StatefulWidget {
  const StudentMessages({Key? key}) : super(key: key);

  @override
  State<StudentMessages> createState() => _StudentMessagesState();
}

class _StudentMessagesState extends State<StudentMessages> {
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
        title: Text('Messages'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
          ),
        ],
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
                      MaterialPageRoute(builder: (context) => StudentMessageOne()),
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
          MaterialPageRoute(builder: (context) => StudentHome()),
        );
      } else if (index == 2) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => StudentNotifications()),
        );
      } else if (index == 3) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileStudent()),
        );
      }
    });
  }
}

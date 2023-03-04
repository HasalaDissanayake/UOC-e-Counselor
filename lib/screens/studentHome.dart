import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorList.dart';
import 'package:uoc_counselor/screens/studentmessages.dart';
import 'package:uoc_counselor/screens/studentnotifications.dart';
import 'package:uoc_counselor/screens/oneCounselor.dart';
import 'package:uoc_counselor/screens/profileStudent.dart';
import 'package:uoc_counselor/screens/searchcounselor.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {

  List<String> doctors = [
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. David Lee',
    'Dr. Sarah Johnson',
    'Dr. Michael Brown',
  ];

  int _currentIndex = 0;

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
        title: Text('UOC e-Counselor'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Row(
                  children: [
                  Expanded(
                    child: Image.asset(
                    "assets/main.jpg",
                    height: 250,
                    fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Counselors',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CounselorList()),
                      );
                    },
                    child: Text('See more'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: doctors.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>CounselorView()),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              "assets/counselor.jpg",
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            doctors[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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

    });
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => StudentMessages()),
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
  }
}


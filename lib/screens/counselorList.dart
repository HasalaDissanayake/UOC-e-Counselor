import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/studentAppoinments.dart';
import 'package:uoc_counselor/screens/studentmessages.dart';
import 'package:uoc_counselor/screens/oneCounselor.dart';
import 'package:uoc_counselor/screens/profileStudent.dart';
import 'package:uoc_counselor/screens/searchcounselor.dart';
import 'package:uoc_counselor/screens/studentHome.dart';

class CounselorList extends StatefulWidget {
  const CounselorList({Key? key}) : super(key: key);

  @override
  State<CounselorList> createState() => _CounselorListState();
}

class _CounselorListState extends State<CounselorList> {

  final List<String> names = [
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
  ];

  final List<String> details = [
    'Hello I am John',
    'Hello i am Jane Smith',
    'Hello I am Bob Johnson',
    'Hello I am John',
    'Hello i am Jane Smith',
    'Hello I am Bob Johnson',
    'Hello I am John',
    'Hello i am Jane Smith',
    'Hello I am Bob Johnson',
  ];

  int _currentIndex = 0;

  final List<Widget> _children = [
    StudentHome(),
    StudentMessages(),
    CounselorAppointment(),
    ProfileStudent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counselor List'),
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
                      MaterialPageRoute(builder: (context) =>CounselorView()),
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
            icon: Icon(Icons.bookmark_add),
            label: 'Appointments',
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
          MaterialPageRoute(builder: (context) => StudentMessages()),
        );
      } else if (index == 2) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorAppointment()),
        );
      } else if (index == 3) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileStudent()),
        );
      }

    });

  }
}

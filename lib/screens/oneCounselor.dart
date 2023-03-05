import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/studentBook.dart';
import 'package:uoc_counselor/screens/studentmessages.dart';
import 'package:uoc_counselor/screens/studentnotifications.dart';
import 'package:uoc_counselor/screens/profileStudent.dart';
import 'package:uoc_counselor/screens/studentHome.dart';
import 'package:uoc_counselor/screens/studentMessageOne.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CounselorView extends StatefulWidget {
  const CounselorView({Key? key}) : super(key: key);

  @override
  State<CounselorView> createState() => _CounselorViewState();
}

class _CounselorViewState extends State<CounselorView> {

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

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('counselors');
  String mobileNo = '';

  void initState() {
    super.initState();
    retrieveData();
  }

  void retrieveData() {
    usersCollection.doc('RTNNzu1jyZWjhv5m51Ik').get().then((doc) {
      if (doc.exists) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          setState(() {
            mobileNo = data['mobileNo'] ?? "";
            print(mobileNo);
          });
        }
      }
    });
  }

  void launchMobileDialer() async {
    final url = 'tel:$mobileNo';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      print('Launching $url');
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counselor John'),
        backgroundColor: Colors.deepPurple,
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
                      "assets/women.jpg",
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // other widgets
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150.0,
                        child: ElevatedButton(
                          onPressed: ()  {
                            launchMobileDialer();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 10.0),
                              Text('Voice Call'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 150.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => StudentMessageOne()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.message),
                              SizedBox(width: 10.0),
                              Text('Messages'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'I have experience of 20 years on counseling. I have worked with many students all around the country.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 250.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return BookCounselor();
                          },
                        ));
                      },
                      child: Text('Book an Appointment'),
                    ),
                  ),
                ),
              ],
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
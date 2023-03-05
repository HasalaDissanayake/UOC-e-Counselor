import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/profileStudent.dart';
import 'package:uoc_counselor/screens/studentHome.dart';
import 'package:uoc_counselor/screens/studentmessages.dart';

class CounselorAppointment extends StatefulWidget {
  const CounselorAppointment({Key? key}) : super(key: key);

  @override
  State<CounselorAppointment> createState() => _CounselorAppointmentState();
}

class _CounselorAppointmentState extends State<CounselorAppointment> {

  int _currentIndex = 2;

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
        backgroundColor: Colors.deepPurple,
        title: Text('My Appointments'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

          },
        ),
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

    });
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => StudentMessages()),
      );
    } else if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => StudentHome()),
      );
    } else if (index == 3) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfileStudent()),
      );
    }
  }
}
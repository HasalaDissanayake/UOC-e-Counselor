import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorHome.dart';
import 'package:uoc_counselor/screens/counselorMessage.dart';
import 'package:uoc_counselor/screens/counselorNotifications.dart';
import 'package:uoc_counselor/screens/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('counselors');
  String name = '';
  String mobileNo = '';
  String email = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isEditing = false;

  @override
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
            name = data['name'] ?? "";
            mobileNo = data['mobileNo'] ?? "";
            email = data['email'] ?? "";
            nameController.text = name;
            mobileNoController.text = mobileNo;
            emailController.text = email;
          });
        }
      }
    });
  }

  void updateData() {
    usersCollection.doc('RTNNzu1jyZWjhv5m51Ik').update({
      'name': nameController.text,
      'mobileNo': mobileNoController.text,
      'email': emailController.text,
    }).then((value) {
      setState(() {
        name = nameController.text;
        mobileNo = mobileNoController.text;
        email = emailController.text;
        isEditing = false;
      });
    }).catchError((error) {
      print("Failed to update data: $error");
    });
  }

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
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/man.jpg'),
                        ),
                      ),
                    ),
                    ListTile(
                      subtitle: SizedBox(
                        width: 300.0,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Name',
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
                            controller: mobileNoController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Mobile No',
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
                            controller: emailController,

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Email',
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
                                onPressed: updateData,
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

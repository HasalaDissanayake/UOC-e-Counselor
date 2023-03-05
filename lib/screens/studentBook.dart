import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/studentAppoinments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookCounselor extends StatefulWidget {
  const BookCounselor({Key? key}) : super(key: key);

  @override
  State<BookCounselor> createState() => _BookCounselorState();
}

class _BookCounselorState extends State<BookCounselor> {

  TextEditingController timeC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  void addbooking() {
    String time = timeC.text;
    String date = dateC.text;

    DocumentReference newBook = FirebaseFirestore.instance.collection(
            'bookings').doc();

        newBook.set({
          'date': date,
          'time': time,
        });
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CounselorAppointment()),
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Schedule a Meeting'),
      ) ,
      body: Container(
        width: double.infinity,
        color: Colors.black12,
        child: ListView(
          children: [
            Column(
              children: [
                ListTile(
                  subtitle: SizedBox(
                    width: 300.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: dateC,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Date',
                          labelText: 'Date - YYYY-MM-DD',
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  subtitle: SizedBox(
                    width: 300.0,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: TextFormField(
                        controller: timeC,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Time',
                          labelText: 'Time - 	HH:MM',
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 20.00),
                    child: SizedBox(
                      width: 100.0,
                      child: ElevatedButton(
                        onPressed: (){
                          addbooking();
                        },
                        child: Text('Book'),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
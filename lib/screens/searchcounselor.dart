import 'package:flutter/material.dart';
import 'package:uoc_counselor/screens/counselorList.dart';

class Search  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Search Counselors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: true,

      ) ,
      body:Container(
        color:Colors.deepPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                width: 350.0,
                height: 70.0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      // labelText: 'Email Address',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CounselorList()),
                    );
                  },
                  child: Text('Search'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

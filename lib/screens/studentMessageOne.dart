import 'package:flutter/material.dart';

class StudentMessageOne extends StatefulWidget {
  const StudentMessageOne({Key? key}) : super(key: key);

  @override
  State<StudentMessageOne> createState() => _StudentMessageOneState();
}

class _StudentMessageOneState extends State<StudentMessageOne> {

  final List<String> _messages = [];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    final message = _controller.text;
                    setState(() {
                      _messages.add(message);
                      _controller.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
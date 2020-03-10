import 'package:flutter/material.dart';
import 'package:hello_flutter/common/watson.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();

  Watson watson = Watson();
  String _text;

  @override
  void initState() {
    super.initState();
    watson.initWatson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'Your Input to the chatbot',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                _text != null ? '$_text' : 'Watson Response Here',
              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          watson.sendMessage('Hello');
        },
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    watson.deleteWatsonSession();
    myController.dispose();
    super.dispose();
  }
}

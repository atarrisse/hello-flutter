import 'package:flutter/material.dart';
import 'package:hello_flutter/common/watson.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final msgController = TextEditingController();

  Watson watson = Watson();
  String _text;
  bool _isLoading = false;

  _sendMessage() async {
    setState(() {
      _isLoading = true;
    });
    print("sending: ${msgController.text}");
    dynamic watsonResponse = await watson.sendMessage(msgController.text);
    setState(() {
      _isLoading = false;
      _text = watsonResponse;
    });

    // watsonAssistantContext = watsonAssistantResponse.context;
    msgController.clear();
  }

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
              TextField(controller: msgController),
              Container(
                child: _isLoading
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.all(5),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        _text != null ? '$_text' : 'Watson Response Here',
                      ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    watson.deleteWatsonSession();
    msgController.dispose();
    super.dispose();
  }
}

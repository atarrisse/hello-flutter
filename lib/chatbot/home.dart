import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_flutter/common/secretLoader.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String platform = 'watsonAssistant';
  final myController = TextEditingController();

  Secrets secrets = Secrets();
  String _sessionId;
  String _text;
  String watsonAuth;
  String watsonQuery;

  Future<String> _createWatsonSession() async {
    var res = await http.post(
        '${secrets.getSecret(platform, 'url')}/v2/assistants/' +
            '${secrets.getSecret(platform, 'assistantID')}/sessions' +
            '?$watsonQuery',
        headers: {'Authorization': watsonAuth});

    if (res.statusCode < 200 || res.statusCode > 299)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    if (res.statusCode == 201) print("✅ session created");
    return json.decode(res.body)['session_id'];
  }

  Future _deleteWatsonSession() async {
    var res = await http.delete(
        '${secrets.getSecret(platform, 'url')}/v2/assistants/' +
            '${secrets.getSecret(platform, 'assistantID')}/sessions' +
            '?$watsonQuery',
        headers: {'Authorization': watsonAuth});
    print(res);
    print(res.statusCode);
    print(res.body);
  }

  @override
  void initState() {
    super.initState();
    secrets.loadSecrets().then((res) {
      String username = 'apikey';
      String password = secrets.getSecret(platform, 'apiKey');
      var params = {'version': secrets.getSecret(platform, 'version')};

      watsonAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
      watsonQuery = params.entries.map((p) => '${p.key}=${p.value}').join('&');

      _createWatsonSession().then((session) {
        _sessionId = session;
      });
    });
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
        // onPressed: _callWatsonAssistant,
        onPressed: _createWatsonSession,
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    _deleteWatsonSession();
    myController.dispose();
    super.dispose();
  }
}

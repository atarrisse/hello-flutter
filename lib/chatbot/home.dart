import 'package:flutter/material.dart';
import 'package:hello_flutter/chatbot/model/watsonResponse.dart';
import 'package:hello_flutter/common/watson.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final msgController = TextEditingController();
  List<WatsonResponse> messages = List<WatsonResponse>();

  Watson watson = Watson();
  String _text;
  bool _isLoading = false;

  _sendMessage() async {
    setState(() {
      _isLoading = true;
    });
    print("sending: ${msgController.text}");
    WatsonResponse watsonResponse =
        await watson.sendMessage(msgController.text);
    messages.add(watsonResponse);
    setState(() {
      _isLoading = false;
      _text = watsonResponse.toString();
    });
    print(messages);
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
          centerTitle: true,
          title: Text("Chatbot"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: new BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        autofocus: true,
                        controller: msgController,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Theme.of(context).primaryColor,
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.send,
                          color: Theme.of(context).backgroundColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        )

        // body: Scaffold(
        //   backgroundColor: Colors.white,
        //   body: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 24.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: <Widget>[
        //         Container(
        //           child: _isLoading
        //               ? Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: <Widget>[
        //                     Container(
        //                       height: 20,
        //                       width: 20,
        //                       margin: EdgeInsets.all(5),
        //                       child: CircularProgressIndicator(
        //                         strokeWidth: 2.0,
        //                         valueColor: AlwaysStoppedAnimation(
        //                           Theme.of(context).primaryColor,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 )
        //               : Text(
        //                   _text != null ? '$_text' : 'Watson Response Here',
        //                 ),
        //         ),
        //         TextField(controller: msgController),
        //         // Row(
        //         //   children: <Widget>[
        //         //     TextField(controller: msgController),
        //         //   ],
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _sendMessage,
        //   child: Icon(Icons.send),
        // ),
        );
  }

  @override
  void dispose() {
    watson.deleteWatsonSession();
    msgController.dispose();
    super.dispose();
  }
}

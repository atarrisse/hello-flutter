import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_flutter/_old/twitter/model/tweet.dart';
import 'package:hello_flutter/model/secretLoader.dart';
import 'package:twitter_api/twitter_api.dart';

Future fetchTweets(String handle) async {
  Secrets secrets = Secrets();

  final _twitterOauth = new twitterApi(
      consumerKey: secrets.getSecret('twitter', 'consumerKey'),
      consumerSecret: secrets.getSecret('twitter', 'consumerSecret'),
      token: secrets.getSecret('twitter', 'accessToken'),
      tokenSecret: secrets.getSecret('twitter', 'accessSecret'));

  Future twitterRequest = _twitterOauth.getTwitterRequest(
    "GET",
    "statuses/user_timeline.json",
    options: {
      "screen_name": handle,
      "count": "20",
      "trim_user": "true",
      "tweet_mode": "extended",
    },
  );

  var res = await twitterRequest;
  if (res.statusCode == 200) {
    return res.body;
  }
  throw Exception('Failed to load tweets');
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Secrets secrets = Secrets();
  String handle = "atarrisse";
  var tweets;

  @override
  void initState() {
    super.initState();
    secrets.loadSecrets().then((secrets) {
      fetchTweets(handle).then((tw) {
        tweets = tw;
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
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).accentColor,
                        child: Text('Submit'),
                        onPressed: () {
                          print(tweets);
                          // List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
                          var jsonTweets = json.decode(tweets) as List;
                          print(jsonTweets);
                          List<Tweet> objs = jsonTweets
                              .map((tweet) => Tweet.fromJson(tweet))
                              .toList();
                          print(objs);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:hello_flutter/components/character/character.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 30.0,
                  children: <Widget>[
                    Container(
                      child: Character(mood: CharacterMood.astonished),
                      width: constraints.maxWidth * 0.4,
                    ),
                    Container(
                      child: Character(mood: CharacterMood.expressionless),
                      width: constraints.maxWidth * 0.4,
                    ),
                    Container(
                      child: Character(mood: CharacterMood.glad),
                      width: constraints.maxWidth * 0.4,
                    ),
                    Container(
                      child: Character(mood: CharacterMood.happy),
                      width: constraints.maxWidth * 0.4,
                    ),
                    Container(
                      child: Character(mood: CharacterMood.neutral),
                      width: constraints.maxWidth * 0.4,
                    ),
                    Container(
                      child: Character(mood: CharacterMood.sad),
                      width: constraints.maxWidth * 0.4,
                    ),
                    Container(
                      child: Character(mood: CharacterMood.unamused),
                      width: constraints.maxWidth * 0.4,
                    ),
                    Container(
                      child: Character(mood: CharacterMood.wink),
                      width: constraints.maxWidth * 0.4,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
              );
            },
          ),
          //     child: Container(
          //   padding: EdgeInsets.all(20),
          //   child: Wrap(
          //     children: <Widget>[
          //       Container(
          //         child: Character(mood: CharacterMood.astonished),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //       Container(
          //         child: Character(mood: CharacterMood.expressionless),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //       Container(
          //         child: Character(mood: CharacterMood.glad),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //       Container(
          //         child: Character(mood: CharacterMood.happy),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //       Container(
          //         child: Character(mood: CharacterMood.neutral),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //       Container(
          //         child: Character(mood: CharacterMood.sad),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //       Container(
          //         child: Character(mood: CharacterMood.unamused),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //       Container(
          //         child: Character(mood: CharacterMood.wink),
          //         width: constraints.maxWidth * 0.4,
          //       ),
          //     ],
          //   ),
          //   // child: Character(mood: CharacterMood.astonished)
          // )
        ));
  }
}

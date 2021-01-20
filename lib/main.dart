import 'package:checkapp/quizbrain.dart';
import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

Quizbrain quizbrain = Quizbrain();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int mark = 0;
  List<Icon> scorekeeper = [];
  void alert() {
    if (quizbrain.questions[quizbrain.questionNum].answerText == null) {
      // Alert(
      //         context: context,
      //         title: "FINISH",
      //         desc: "Your Total Mark : $mark.")
      //     .show();

      Alert(
        context: context,
        type: AlertType.success,
        title: "FINISH",
        desc: "Your Total Mark : $mark.",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      quizbrain.questionNum = 0;
      scorekeeper.clear();
      mark = 0;
    } else {
      quizbrain.next();
    }
  }

  void addscore(bool scoretype) {
    setState(() {
      if (quizbrain.getAnswer() == scoretype) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        mark++;
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      alert();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        quizbrain.getQuestion(),
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        addscore(true);
                      },
                      color: Colors.green,
                      child: Text(
                        'True',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        addscore(false);
                      },
                      color: Colors.red,
                      child: Text(
                        'False',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: scorekeeper,
                )
              ],
            ),
          ),
        ));
  }
}

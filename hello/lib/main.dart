import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstnum = 0;
  int secndnum = 0;
  String displaytext = "";
  String res = '';
  String opopform = '';

  void btnclicked(String btnval) {
    if (btnval == "C") {
      displaytext = "";
      firstnum = 0;
      secndnum = 0;
      res = "";
    }
    else if (btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/") {
      firstnum = int.parse(displaytext);
      res = "";
      opopform = btnval;
    }
    else if (btnval == "=") {
      secndnum = int.parse(displaytext);
      if (opopform == "+") {
        res = (firstnum + secndnum).toString();
      }
      if (opopform == "-") {
        res = (firstnum - secndnum).toString();
      }
      if (opopform == "x") {
        res = (firstnum * secndnum).toString();
      }
      if (opopform == "/") {
        res = (firstnum ~/ secndnum).toString();
      }
    }
    else {
      res = int.parse(displaytext + btnval).toString();
    }
    setState(() {
      displaytext = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
              fontSize: 25.0
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$displaytext",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
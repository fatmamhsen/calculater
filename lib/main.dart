import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Calculater App',
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int firstnum = 0;
  int secondnum = 0;
  String textdisplay = '';
  String res = '';
  String operation = '';

  void btnclicked(String btntext) {

    if (btntext == 'C') {
      textdisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
      operation = '';
    } else if (btntext == '+' ||
        btntext == '-' ||
        btntext == 'x' ||
        btntext == '/') {
      firstnum = int.parse(textdisplay);
      res = '';
      operation = btntext;
    } else if (btntext == "=") {
      secondnum = int.parse(textdisplay);
      if (operation == '+') {
        res = (firstnum + secondnum).toString();
      }
      if (operation == '-') {
        res = (firstnum - secondnum).toString();
      }
      if (operation == 'x') {
        res = (firstnum * secondnum).toString();
      }
      if (operation == '/') {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(textdisplay + btntext).toString();
    }

    setState(() {
      textdisplay = res;
    });
  }

  Widget customButton(String btn, Color colur) {
    return Expanded(
      child: MaterialButton(
        onPressed: () => btnclicked(btn),
        child: CircleAvatar(
          radius: 50.0,
          backgroundColor: colur,
          child: Text(
            '$btn',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 29, 35, 1),
      body: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(24, 29, 35, 1),
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.fromLTRB(10, 70, 10, 70),
            child: Column(
              children: <Widget>[
                Text(
                  '$firstnum $operation $secondnum',
                  style: TextStyle(
                    color: Colors.teal.shade400,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                ),
                Text(
                  '$res',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height - 242.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    customButton('C', const Color.fromRGBO(252, 222, 220, 1)),
                    customButton('+/-', const Color(0xffffffff)),
                    customButton('%', const Color(0xffffffff)),
                    customButton('/', const Color.fromRGBO(238, 240, 237, 1)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customButton('7 ', const Color(0xffffffff)),
                    customButton('8', const Color(0xffffffff)),
                    customButton('9', const Color(0xffffffff)),
                    customButton('x', const Color.fromRGBO(238, 240, 237, 1)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customButton('4', const Color(0xffffffff)),
                    customButton('5', const Color(0xffffffff)),
                    customButton('6', const Color(0xffffffff)),
                    customButton('-', const Color.fromRGBO(238, 240, 237, 1)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customButton('1', const Color(0xffffffff)),
                    customButton('2', const Color(0xffffffff)),
                    customButton('3', const Color(0xffffffff)),
                    customButton('+', const Color.fromRGBO(238, 240, 237, 1)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customButton('0', const Color(0xffffffff)),
                    customButton('.', const Color(0xffffffff)),
                    customButton('', const Color(0xffffffff)),
                    customButton('=', const Color.fromRGBO(21, 233, 193, 1)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

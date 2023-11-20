import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numeric Keyboard Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Numeric Keyboard Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(text),
          NumericKeyboard(
            buttonWidget: (value, onKeyboardTap) => Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              child: Material(
                color: Colors.white.withAlpha(51),
                borderRadius: BorderRadius.circular(45),
                child: InkWell(
                  splashColor: Colors.white.withAlpha(128),
                  borderRadius: BorderRadius.circular(45),
                  onTap: onKeyboardTap,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            onKeyboardTap: _onKeyboardTap,
            textColor: Colors.white,
            rightButtonFn: () {
              setState(() {
                text = text.substring(0, text.length - 1);
              });
            },
            rightIcon: Icon(
              Icons.backspace,
              color: Colors.white,
            ),
            leftButtonFn: () {
              print('left button clicked');
            },
            leftIcon: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }
}

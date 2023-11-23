library numeric_keyboard;

import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  /// If true the buttons will be wrapped in Expanded widget,
  /// so they will take all the space possible and
  /// mainAxisAlignment will not be effective
  /// getAllSpace [default = false]
  final bool getAllSpace;

  /// Customize your number buttons
  final Decoration? buttonsDecoration;

  /// Customize padding of the buttons
  final Padding buttonsPadding;

  /// Customize your style for numbers
  final TextStyle numbersTextStyle;

  NumericKeyboard({
    Key? key,
    required this.onKeyboardTap,
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.getAllSpace = false,
    this.buttonsDecoration,
    this.buttonsPadding = const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
    ),
    this.numbersTextStyle = const TextStyle(
        fontSize: 25,
        fontFamily: 'Arial',
        fontWeight: FontWeight.w400,
        color: Colors.black),
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: <Widget>[
              _buttonBottom(
                InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: widget.leftButtonFn,
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: widget.leftIcon)),
              ),
              _calcButton('0'),
              _buttonBottom(
                InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: widget.rightButtonFn,
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: widget.rightIcon)),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _calcButton(String value) {
    return widget.getAllSpace
        ? Expanded(child: _calcButtonInside(value))
        : _calcButtonInside(value);
  }

  Widget _buttonBottom(Widget insideButton) {
    return widget.getAllSpace ? Expanded(child: insideButton) : insideButton;
  }

  Widget _calcButtonInside(String value) {
    return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: () {
        widget.onKeyboardTap(value);
      },
      child: Padding(
        padding: widget.buttonsPadding.padding,
        child: Container(
          decoration: widget.buttonsDecoration,
          alignment: Alignment.center,
          child: Text(
            value,
            style: widget.numbersTextStyle,
          ),
        ),
      ),
    );
  }
}

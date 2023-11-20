/// Project library for Numeric Keyboard, created by Hugo EXTRAT
library numeric_keyboard;

import 'package:flutter/material.dart';

/// Type definition for callback function
typedef KeyboardTapCallback = void Function(String text);

/// NumericKeyboard Widget
class NumericKeyboard extends StatefulWidget {
  /// Constructor for NumericKeyboard
  const NumericKeyboard({
    required this.onKeyboardTap,
    super.key,
    this.buttonWidget,
    this.textColor = Colors.black,
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
  });

  /// Custom encompassing widget for numeric buttons
  final Widget Function(String value, void Function() onTap)? buttonWidget;

  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final void Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final void Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  @override
  State<StatefulWidget> createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 20),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ButtonBar(
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                _calcButton('1'),
                _calcButton('2'),
                _calcButton('3'),
              ],
            ),
            ButtonBar(
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                _calcButton('4'),
                _calcButton('5'),
                _calcButton('6'),
              ],
            ),
            ButtonBar(
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                _calcButton('7'),
                _calcButton('8'),
                _calcButton('9'),
              ],
            ),
            ButtonBar(
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.leftButtonFn,
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: widget.leftIcon,
                  ),
                ),
                _calcButton('0'),
                InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.rightButtonFn,
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: widget.rightIcon,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _calcButton(String value) {
    if (widget.buttonWidget != null) {
      return widget.buttonWidget!(
        value,
        () => widget.onKeyboardTap(value),
      );
    } else {
      return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
            ),
          ),
        ),
      );
    }
  }
}

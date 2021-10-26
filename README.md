# numeric_keyboard

[![pub package](https://img.shields.io/pub/v/numeric_keyboard.svg?style=for-the-badge&color=blue)](https://pub.dartlang.org/packages/numeric_keyboard)

A simple numeric keyboard widget

## Installation

Add `numeric_keyboard: ^1.1.0` in your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:numeric_keyboard/numeric_keyboard.dart';
```

## How to use

Simply create a `NumericKeyboard` widget and pass the required params:

```dart
NumericKeyboard(
  onKeyboardTap: _onKeyboardTap
)

_onKeyboardTap(String value) {
  setState(() {
    text = text + value;
  });
}
```

## Params

```dart
NumericKeyboard(
  onKeyboardTap: _onKeyboardTap,
  textColor: Colors.red,
  rightButtonFn: () {
    setState(() {
      text = text.substring(0, text.length - 1);
    });
  },
  rightIcon: Icon(Icons.backspace, color: Colors.red, size: 26),
  leftButtonFn: () {
    print('left button clicked');
  },
  leftIcon: Icon(Icons.check, color: Colors.red, size: 26),
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  fontSize: 26,
  buttonSize: 50,
  fontWeight: FontWeight.bold,
)
```

For a more detail example please take a look at the `example` folder.

## Example

Numeric keyboard:

<img src="https://raw.githubusercontent.com/huextrat/numeric_keyboard/master/example/screenshot.png" width="400" height="790">

## -

If something is missing, feel free to open a ticket or contribute!

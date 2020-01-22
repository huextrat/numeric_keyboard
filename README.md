# numeric_keyboard

[![pub package](https://img.shields.io/pub/v/numeric_keyboard.svg?style=for-the-badge&color=blue)](https://pub.dartlang.org/packages/numeric_keyboard)

A simple steps indicator widget

## Installation

Add `numeric_keyboard: ^0.1.1` in your `pubspec.yaml` dependencies. And import it:

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
  rightIcon: Icon(Icons.backspace, color: Colors.red,),
  leftButtonFn: () {
    print('left button clicked');
  },
  leftIcon: Icon(Icons.check, color: Colors.red,)
)
```

For a more detail example please take a look at the `example` folder.

## Example

Steps indicator:

<img src="https://raw.githubusercontent.com/huextrat/numeric_keyboard/master/example/screenshot.png" width="400" height="790">

## -

If something is missing, feel free to open a ticket or contribute!

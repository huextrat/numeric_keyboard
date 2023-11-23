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
  buttonsDecoration: defaultDecoration,
  onKeyboardTap: _onKeyboardTap,
  getAllSpace: true,
  numbersTextStyle: TextStyle(
    fontSize: 25,
    fontFamily: 'Arial',
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  rightButtonFn: () {
    setState(() {
      text = text.substring(0, text.length - 1);
    });
  },
  rightIcon: Icon(
    Icons.backspace,
    color: Colors.black,
  ),
  leftButtonFn: () {
    print('left button clicked');
  },
  leftIcon: Icon(
    Icons.check,
    color: Colors.black,
  ),
),

Decoration defaultDecoration = ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 0.50,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color(0xFFAFAFAF),
      ),
      borderRadius: BorderRadius.circular(4.60),
    ),
    shadows: const [
      BoxShadow(
        color: Color(0x4C000000),
        blurRadius: 0,
        offset: Offset(0, 1),
        spreadRadius: 0,
      )
    ],
  );
```

For a more detail example please take a look at the `example` folder.

## Example

Numeric keyboard:

<img src="example\screenshot.png" width="400" height="790">
<img src="example\screenshot2.png" width="400" height="790">

## -

If something is missing, feel free to open a ticket or contribute!

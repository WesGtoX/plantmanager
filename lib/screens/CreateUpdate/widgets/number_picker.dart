import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
// import 'package:plantmanager/core/core.dart';

class InputNumberPicker extends StatefulWidget {
  int _currentValue = 1;
  int _minValue = 1;
  int _maxValue = 60;

  InputNumberPicker(this._currentValue, this._minValue, this._maxValue);

  @override
  _InputNumberPickerState createState() => _InputNumberPickerState(
      this._currentValue, this._maxValue, this._minValue);
}

class _InputNumberPickerState extends State<InputNumberPicker> {
  int _currentValue = 1;
  int _minValue = 1;
  int _maxValue = 60;

  _InputNumberPickerState(this._currentValue, this._maxValue, this._minValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: _currentValue,
          minValue: _minValue,
          maxValue: _maxValue,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
      ],
    );
  }
}

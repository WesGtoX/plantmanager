import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
// import 'package:plantmanager/core/core.dart';

class InputNumberPicker extends StatefulWidget {
  late int _currentValue = 1;
  late int _minValue = 1;
  late int _maxValue = 60;

  InputNumberPicker(this._currentValue, this._minValue, this._maxValue);

  @override
  _InputNumberPickerState createState() => _InputNumberPickerState(
      this._currentValue, this._maxValue, this._minValue);

      
  String getValue() {
    return this._currentValue.toString();
  }

}

class _InputNumberPickerState extends State<InputNumberPicker> {
  late int _currentValue = 1;
  late int _minValue = 1;
  late int _maxValue = 60;

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

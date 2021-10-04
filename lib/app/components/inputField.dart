import 'package:flutter/material.dart';
import 'package:videoflix/app/utils/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController _controller;
  final String _labelText;
  final String? _errorText;
  final FocusNode _focusNode;
  final TextInputType _type;
  final bool isPassword;

  InputField(
      this._controller, this._labelText, this._errorText, this._focusNode,
      {bool isPassword = false, TextInputType type = TextInputType.text})
      : this.isPassword = isPassword,
        this._type = type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: _type,
      controller: _controller,
      focusNode: _focusNode,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: _labelText,
        errorText: _errorText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            width: 0.0,
          ),
        ),
        fillColor: fundoCinzaTextField,
        filled: true,
      ),
      // InputDecoration(
      //   contentPadding: const EdgeInsets.all(15.0),
      //   border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(25.0),
      //       borderSide:
      //           BorderSide(color: Color.fromRGBO(255, 255, 255, 0.4))),
      //   disabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(25.0),
      //       borderSide:
      //           BorderSide(color: Color.fromRGBO(255, 255, 255, 0.4))),
      //   focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(25.0),
      //       borderSide: BorderSide(color: Color.fromRGBO(230, 38, 39, 0.8))),
      //   fillColor: Color.fromRGBO(255, 255, 255, 0.4),
      //   filled: true,
      //   hintText: _hintText,
      //   hintStyle: UIConstants.fieldHintStyle,
      // ),
    );
  }
}

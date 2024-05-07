import 'package:flutter/material.dart';

class InputBorders {
  InputBorders._();
  static const border = OutlineInputBorder(
  borderRadius:  BorderRadius.all(Radius.circular(12.0)),
  borderSide:  BorderSide(color: Color(0xffffffff), width: 2));


  static const enabledBorder =  OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xffffffff), width: 2));

  static const focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xffFFFFFF), width: 3));


  static const errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xffff4444), width: 2));


  static const focusedErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xffff4444), width: 3));

  static const disabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.0)),
  borderSide: BorderSide(color: Color(0xffffffff), width: 2));

  static const labelStyleText = TextStyle(color: Color(0xffdcdcdc), fontWeight: FontWeight.w400);
}
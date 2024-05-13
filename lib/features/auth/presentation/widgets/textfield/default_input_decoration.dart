import 'package:flutter/material.dart';
@Deprecated('Не дает адекватно кастомизировать текстовые поля. Лучше использовать константы для определения границ')
class DefaultInputDecoration extends InputDecoration {
  const DefaultInputDecoration(String hintText)
      : super(
            border: const OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(12.0)),
                borderSide:  BorderSide(color: Color(0xffffffff), width: 2)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffffffff), width: 2)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffFFFFFF), width: 3)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffff4444), width: 2)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffff4444), width: 3)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffffffff), width: 2)),
            labelText: hintText,
            labelStyle: const TextStyle(color: Color(0xffdcdcdc), fontWeight: FontWeight.w400),
            isDense: true);
}

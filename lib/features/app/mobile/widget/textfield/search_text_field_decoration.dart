import 'package:flutter/material.dart';

import '../../../../../core/utils/presentation/app_colors.dart';

class SearchTextFieldDecoration extends InputDecoration {
  const SearchTextFieldDecoration(String hintText)
      : super(
      border: const OutlineInputBorder(
          borderRadius:  BorderRadius.all(Radius.circular(12.0)),
          borderSide:  BorderSide.none),
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none),
      focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none),
      disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none),
      hintText: hintText,
      prefixIcon: const Icon(Icons.search),
      hintStyle: const TextStyle(color: AppColor.searchTextFieldFontHint, fontWeight: FontWeight.w400, fontSize: 16),
      isDense: true);
}

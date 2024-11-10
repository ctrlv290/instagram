import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_size.dart';

InputDecoration textInputDecor(String hintText) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: Colors.grey[100],
    focusedBorder: activeInputBorder(),
    enabledBorder: activeInputBorder(),
    errorBorder: errorInputBorder(),
    focusedErrorBorder: errorInputBorder(),
  );
}

OutlineInputBorder errorInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[300]),
      borderRadius: BorderRadius.circular(common_s_gap));
}

OutlineInputBorder activeInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]),
      borderRadius: BorderRadius.circular(common_s_gap));
}

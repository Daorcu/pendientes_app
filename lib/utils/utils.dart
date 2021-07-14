import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));

  static DateTime? toDateTime(Timestamp value) {
    if (value.toString().isEmpty) return null;
    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date) {
    if (date.toString().isEmpty) return null;
    return date.toUtc();
  }
}
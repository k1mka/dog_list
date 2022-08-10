import 'package:array_names/business_logic/get_it.dart';
import 'package:flutter/material.dart';
import 'dogs_app.dart';

void main() {
  setupServiceLocator();
  runApp(
    const DogsApp(),
  );
}

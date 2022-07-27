import 'package:array_names/service_locator.dart';
import 'package:flutter/material.dart';
import 'dogs_app.dart';

void main() {
  setupServiceLocator();
  runApp(const DogsApp());
}

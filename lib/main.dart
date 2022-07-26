import 'package:array_names/data/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/repository.dart';
import 'dogs_app.dart';

final getIt = GetIt.instance;

void _setupLocator() {
  const NetworkService service = NetworkService();
  getIt.registerSingleton<NetworkService>(service);
  getIt.registerSingleton<Repository>(const Repository(service));
}

void main() {
  _setupLocator();
  runApp(const DogsApp());
}

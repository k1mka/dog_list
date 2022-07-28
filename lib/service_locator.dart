import 'package:get_it/get_it.dart';

import 'data/repositories/repository.dart';
import 'data/repositories/repository_impl.dart';
import 'data/services/network_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  NetworkService service = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(service);
  getIt.registerSingleton<Repository>(RepositoryImpl(service));
}

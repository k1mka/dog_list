import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/repositories/repository_impl.dart';
import 'package:array_names/data/services/network_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  NetworkService service = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(service);
  getIt.registerSingleton<Repository>(RepositoryImpl(service));
}

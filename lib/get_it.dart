import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/repositories/repository_impl.dart';
import 'package:array_names/data/services/analytic_service.dart';
import 'package:array_names/data/services/network_service.dart';
import 'package:get_it/get_it.dart';
import 'data/services/analityc_service_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  AnalyticService analyticService = AnalyticServiceImpl();
  NetworkService service = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(service);
  getIt.registerSingleton<AnalyticService>(analyticService);
  getIt.registerSingleton<Repository>(RepositoryImpl(service));
}

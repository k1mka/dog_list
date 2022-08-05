import 'data/repositories/repository.dart';
import 'data/repositories/repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/services/network_service.dart';

final _networkServiceProvider = Provider<NetworkService>(
  (ref) => NetworkServiceImpl(),
);

final repositoryProvider = Provider<Repository>(
  (ref) {
    final networkService = ref.read(_networkServiceProvider);
    return RepositoryImpl(networkService);
  },
);

import 'package:array_names/business_logic/cubit_states/dog_list_state.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogListCubit extends Cubit<DogListState> {
  Repository repo;
  DogListCubit(this.repo) : super(InitialState());

  void cubitFetchDogs() async {
    emit(LoadingDogs()); // заэмитить
    try {
      final breeds = await repo.fetchDogs();
      emit(LoadedDogs(breeds));
    } catch (e) {
      emit(ErrorDogs(e));
    }
  }
}

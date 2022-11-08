import 'package:array_names/business_logic/cubit_states/dog_list_state.dart';
import 'package:array_names/business_logic/cubit_states/dogs_event.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogListBloc extends Bloc<DogsEvent, DogListState> {
  Repository repo;
  DogListBloc(this.repo) : super(InitialState()) {
    on<LoadingDogsEvent>((event, emit) async {
      emit(LoadingDogs());
      try {
        final breeds = await repo.fetchDogs();
        emit(LoadedDogs(breeds));
      } catch (e) {
        emit(ErrorDogs(e));
      }
    });
  }
}

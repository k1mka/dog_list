import 'package:array_names/business_logic/cubit_states/dog_list_state.dart';
import 'package:array_names/business_logic/cubit_states/dogs_event.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/services/analytic_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogListBloc extends Bloc<DogsEvent, DogListState> {
  Repository repo;
  AnalyticService analyticService;
  DogListBloc(this.repo, this.analyticService) : super(InitialState()) {
    on<LoadingDogsEvent>((event, emit) async {
      emit(LoadingDogs());
      try {
        final breeds = await repo.fetchDogs();
        emit(LoadedDogs(breeds));
      } catch (e) {
        emit(ErrorDogs(e));
      }
    });
    on<FireBaseAnalyticEvent>((event, emit) async {
      try {
        await analyticService.sendAnalyticsEvent(
            eventName: 'click_on_the_${event.breed.getFullNameToFirebase}', clickEvent: 'clickEvent');
      } catch (e) {
        print('error in Block');
      }
    });
  }
}

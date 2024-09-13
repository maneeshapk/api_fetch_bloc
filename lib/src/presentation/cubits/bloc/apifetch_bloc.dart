
import 'package:bloc_task/src/data/datasource/remote/apifetching.dart';
import 'package:bloc_task/src/presentation/cubits/bloc/apifetch_event.dart';
import 'package:bloc_task/src/presentation/cubits/bloc/apifetch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SuperheroBloc extends Bloc<SuperheroEvent, SuperheroState> {
  final SuperheroRepository _repository;

  SuperheroBloc(this._repository) : super(SuperheroInitial()) {
    on<FetchSuperheroes>((event, emit) async {
      emit(SuperheroLoading());

      {
        final superheroes = await _repository.fetchSuperheroes();
        emit(SuperheroLoaded(superheroes));
      } 
    });
  }
}

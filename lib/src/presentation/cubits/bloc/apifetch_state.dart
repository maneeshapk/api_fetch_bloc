

import 'package:bloc_task/src/domain/model/datamodel.dart';

abstract class SuperheroState {}

class SuperheroInitial extends SuperheroState {}

class SuperheroLoading extends SuperheroState {}

class SuperheroLoaded extends SuperheroState {
  final List<Superhero> superheroes;

  SuperheroLoaded(this.superheroes);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuperheroLoaded &&
          runtimeType == other.runtimeType &&
          superheroes == other.superheroes;

  @override
  int get hashCode => superheroes.hashCode;
}


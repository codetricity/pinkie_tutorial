part of 'score_bloc.dart';

abstract class ScoreEvent extends Equatable {
  const ScoreEvent();

  @override
  List<Object> get props => [];
}

class IncreaseScoreEvent extends ScoreEvent {}

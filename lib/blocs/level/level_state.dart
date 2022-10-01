part of 'level_cubit.dart';

class LevelState extends Equatable {
  final int level;

  const LevelState(
    this.level,
  );

  @override
  List<Object> get props => [level];

  LevelState copyWith({
    int? level,
  }) {
    return LevelState(
      level ?? this.level,
    );
  }

  @override
  bool get stringify => true;
}

class LevelInitial extends LevelState {
  const LevelInitial() : super(1);
}

class LevelIncreased extends LevelState {
  final int newLevel;
  const LevelIncreased(this.newLevel) : super(newLevel);
}

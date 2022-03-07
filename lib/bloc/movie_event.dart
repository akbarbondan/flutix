part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

}

class FestMovieEvent extends MovieEvent{
  @override
  List<Object> get props => throw UnimplementedError();

}
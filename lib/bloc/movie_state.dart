part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  

}

class MovieInitial extends MovieState {
  
  @override
  List<Object> get props => [];
}

class MovieLoadedState extends MovieState {
  final List<ModelMovie> movies;
  MovieLoadedState({this.movies});
  @override
  List<Object> get props => [movies];
}

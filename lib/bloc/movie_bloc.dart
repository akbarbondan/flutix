import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_fllutix/models/models.dart';
import 'package:bwa_fllutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
 @override  
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
   if(event is FestMovieEvent){
     List<ModelMovie> movies = await MoiveServices.getMovies(1);
     yield MovieLoadedState(movies:movies);
   }
  }

  
}

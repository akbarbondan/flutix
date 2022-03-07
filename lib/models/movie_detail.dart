part of 'models.dart';

class ModelMovieDetail extends ModelMovie {
  final String language;
  final List<String> genres;
  ModelMovieDetail(ModelMovie movie, {this.genres, this.language})
      : super(
            id: movie.id,
            title: movie.title,
            voteAverage: movie.voteAverage,
            overview: movie.overview,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath);

  String get genreAndLanguage{
    String s = "";
    for(var genre in genres){
      s += genre + (genre != genres.last ? "," : "");
    }

    return "$s - $language";
  }

  @override
  List<Object> get props => super.props + [language, genres];
}

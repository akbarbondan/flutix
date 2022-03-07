part of 'models.dart';

class ModelMovie extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String backdropPath;

  ModelMovie(
      {@required this.id,
      @required this.title,
      @required this.voteAverage,
      @required this.overview,
      @required this.posterPath,
      @required this.backdropPath});

  factory ModelMovie.fromJson(Map<String, dynamic> json) => ModelMovie(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path']);
  @override
  List<Object> get props =>
      [id, title, voteAverage, overview, posterPath, backdropPath];
}

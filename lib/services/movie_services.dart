part of 'services.dart';

class MoiveServices {
  static Future<List<ModelMovie>> getMovies(int page,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiURL&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";

    client ??= http.Client();

    var respond = await client.get(url);
    if (respond.statusCode != 200) {
      return [];
    }
    var data = json.decode(respond.body);
    List result = data['results'];

    return result.map((e) => ModelMovie.fromJson(e)).toList();
  }

  static Future<ModelMovieDetail> getDetailMovie(ModelMovie movie,
      {int movieID, http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieID ?? movie.id}?api_key=$apiURL&language=en-US";
    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)['genres'];

    String language;
    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = "Japanese";
        break;
      case 'en':
        language = "English";
        break;
      case 'id':
        language = "Indonesia";
        break;
      case 'ko':
        language = "Korean";
        break;
      default:
    }

    return movieID != null ?  ModelMovieDetail(ModelMovie.fromJson(data),
        language: language,
        genres: genres
            .map((e) => (e as Map<String, dynamic>)['name'].toString())
            .toList()) : 
            ModelMovieDetail(movie,
        language: language,
        genres: genres
            .map((e) => (e as Map<String, dynamic>)['name'].toString())
            .toList())
            ;
  }

  static Future<List<ModelCredit>> getCredits(int movieId,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiURL&language=en-US";
    client ??= http.Client();
    var respond = await client.get(url);
    var data = json.decode(respond.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => ModelCredit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }
}

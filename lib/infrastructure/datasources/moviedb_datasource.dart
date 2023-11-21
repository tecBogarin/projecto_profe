import 'package:dio/dio.dart';
import 'package:proyecto_profe/config/constants/environment.dart';
import 'package:proyecto_profe/domain/datasources/movies_datasource.dart';
import 'package:proyecto_profe/domain/entities/movie.dart';
import 'package:proyecto_profe/infrastructure/mappers/movie_mapper.dart';
import 'package:proyecto_profe/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDataSource extends MoviesDataSource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }



}
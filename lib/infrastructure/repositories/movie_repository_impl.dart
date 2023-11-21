import 'package:proyecto_profe/domain/datasources/movies_datasource.dart';
import 'package:proyecto_profe/domain/entities/movie.dart';
import 'package:proyecto_profe/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDataSource dataSource;
  MovieRepositoryImpl(this.dataSource);

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }


}
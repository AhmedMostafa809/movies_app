import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedUseCase {
  BaseMoviesRepository baseMoviesRepository;
  GetTopRatedUseCase(this.baseMoviesRepository);
  Future<Either< Failure , List<Movie>>> execute () async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
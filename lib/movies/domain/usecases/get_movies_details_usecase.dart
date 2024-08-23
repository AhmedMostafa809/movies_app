import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase {

  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  Future<Either<Failure, MovieDetails>> execute (int id) async{
    return await baseMoviesRepository.getMoviesDetails(id);
  }
}
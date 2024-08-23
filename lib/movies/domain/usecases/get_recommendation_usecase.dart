import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase {

  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Recommendation>>> execute(int id) async{
    return await baseMoviesRepository.getRecommendation(id);
  }
}
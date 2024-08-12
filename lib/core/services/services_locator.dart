import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repositories.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLOC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    ///USE CASE
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

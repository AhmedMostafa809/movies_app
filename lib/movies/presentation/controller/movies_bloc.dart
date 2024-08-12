import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingMoviesUseCase;
  final GetPopularUseCase getPopularMoviesUseCase;
  final GetTopRatedUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
      this.getTopRatedMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getNowPlayingMoviesUseCase,
      ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(
          (event, emit) async {
            final result = await getNowPlayingMoviesUseCase.execute();
            result.fold(
                    (l) => emit(
                        state.copyWith(
                      nowPlayingState: RequestStatus.error,
                      message: l.message,
                    )),
                    (r) => emit(
                        state.copyWith(
                      nowPlayingState: RequestStatus.loaded,
                      nowPlayingMovies: r,
                )));
          }
    );
    on<GetPopularMoviesEvent>(
            (event, emit) async {
          final result =  await getPopularMoviesUseCase.execute();

          result.fold(
                  (l) => emit(
                  state.copyWith(
                    popularState: RequestStatus.error,
                    message: l.message,
                  )),
                  (r) => emit(
                      state.copyWith(
                    popularState: RequestStatus.loaded,
                    popularMovies: r,
                  )));
        }
    );

    on<GetTopRatedMoviesEvent>(
            (event, emit) async {
          final result = await getTopRatedMoviesUseCase.execute();
          result.fold(
                  (l) => emit(
                  state.copyWith(
                    topRatedState: RequestStatus.error,
                    message: l.message,
                  )),
                  (r) => emit(
                      state.copyWith(
                    topRatedState: RequestStatus.loaded,
                    topRatedMovies: r,
                  )));
        }
    );

  }

}
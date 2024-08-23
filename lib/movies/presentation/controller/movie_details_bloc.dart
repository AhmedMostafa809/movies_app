import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,
      this.getRecommendationUseCase
      )
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMoviesDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase.execute(event.id);

    result.fold(
          (l) => emit(state.copyWith(
        movieDetailsState: RequestStatus.error,
        movieDetailsMessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestStatus.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase.execute(event.id);

    result.fold(
          (l) => emit(state.copyWith(
        recommendationState: RequestStatus.error,
        recommendationMessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestStatus.loaded,
        ),
      ),
    );
  }
}

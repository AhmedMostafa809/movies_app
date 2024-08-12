import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestStatus nowPlayingState;
  final String message;
  final List<Movie> popularMovies;
  final RequestStatus popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestStatus topRatedState;
  final String topRatedMessage;

  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestStatus.loading,
      this.message = '',
      this.popularMovies = const [],
      this.popularState = RequestStatus.loading,
      this.popularMessage = '',
      this.topRatedMovies = const [],
      this.topRatedState = RequestStatus.loading,
      this.topRatedMessage = ''});

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestStatus? nowPlayingState,
    String? message,
    List<Movie>? popularMovies,
    RequestStatus? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestStatus? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        message: message ?? this.message,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage);
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage
      ];
}

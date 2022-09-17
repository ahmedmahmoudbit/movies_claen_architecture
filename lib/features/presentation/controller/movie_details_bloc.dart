import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:movies_app/features/presentation/controller/movie_details_event.dart';
import 'package:movies_app/features/presentation/controller/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getMovieRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
    await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
            (failure) => emit(state.copyWith(
          movieDetailState: RequestState.loading,
          movieDetailsMessage: failure.message,
        )),
            (movieDetails) => emit(
          state.copyWith(
            movieDetail: movieDetails,
            movieDetailState: RequestState.loaded,
          ),
        ));
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
    await getMovieRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
          (failure) => emit(state.copyWith(
        movieRecommendationState: RequestState.loading,
        movieRecommendationsMessage: failure.message,
      )),
          (movieRecommend) => emit(
        state.copyWith(
            movieRecommendation: movieRecommend,
            movieRecommendationState: RequestState.loaded),
      ),
    );
  }
}
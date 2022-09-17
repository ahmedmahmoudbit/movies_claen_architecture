import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/domain/entity/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/domain/entity/movie_detail.dart';
import 'package:movies_app/features/domain/entity/recommendation.dart';
import 'package:movies_app/features/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameters parameters);
}
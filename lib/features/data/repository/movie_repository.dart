import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/data/datasource/remote_datasource.dart';
import 'package:movies_app/features/domain/entity/movie.dart';
import 'package:movies_app/features/domain/entity/movie_detail.dart';
import 'package:movies_app/features/domain/entity/recommendation.dart';
import 'package:movies_app/features/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/domain/usecases/get_movie_recommendation_usecase.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MovieRepository({required this.baseMoviesRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatesMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(RecommendationParameters parameters) async{
    final result = await baseMoviesRemoteDataSource.getMovieRecommendation(parameters);
    try{
      return Right(result);
    } on ServerExceptions catch(failure){
      return Left( ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
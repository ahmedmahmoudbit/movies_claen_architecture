import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/features/domain/entity/movie_detail.dart';
import 'package:movies_app/features/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameter) async {
    return await baseMoviesRepository.getMovieDetails(parameter);
  }

}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
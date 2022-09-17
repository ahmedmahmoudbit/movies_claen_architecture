import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/features/domain/entity/movie.dart';
import 'package:movies_app/features/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});


  @override
  Future<Either<Failure, List<Movie>>> call(parameter) async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}

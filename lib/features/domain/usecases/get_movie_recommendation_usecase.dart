import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/features/domain/entity/recommendation.dart';
import 'package:movies_app/features/domain/repository/base_movie_repository.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameter) async{
    return await baseMoviesRepository.getMovieRecommendation(parameter);
  }
}

class RecommendationParameters extends Equatable{
  final int id;
  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}
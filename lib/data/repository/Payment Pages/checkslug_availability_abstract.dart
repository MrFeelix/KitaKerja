import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Payment%20Pages/CheckSlugAvaliabilityResponse.dart';

abstract class CheckSlugAvaliabilityRepo{
  Future<Either<Failure, CheckSlugAvaliabilityResponse>> checkslugavaliability(
);
}
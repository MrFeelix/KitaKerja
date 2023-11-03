import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/body/Plans/Update%20Plans.dart';
import 'package:kitakerja/models/response/Plans/UpdatePlansResponse.dart';

abstract class UpdatePlansRepo{
  Future<Either<Failure, UpdatePlansResponse>> updateplans({
      required UpdatePlans payload,
  });
}
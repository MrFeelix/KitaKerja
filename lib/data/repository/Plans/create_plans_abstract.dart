import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/body/Plans/Create%20Plans.dart';
import 'package:kitakerja/models/response/Plans/CreatePlansResponse.dart';

abstract class CreatePlansRepo{
  Future<Either<Failure, CreatePlansResponse>> createPlans({
      required CreatePlans payload,
  });
}
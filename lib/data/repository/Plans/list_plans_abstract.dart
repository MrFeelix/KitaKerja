
import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Plans/ListPlansResponse.dart';

abstract class ListPlanRepo{
  Future<Either<Failure, ListPlansResponse>> listplan();
}
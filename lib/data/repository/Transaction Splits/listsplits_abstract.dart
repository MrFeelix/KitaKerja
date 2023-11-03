import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Transactions%20Splits/ListSplitsResponse.dart';

abstract class ListSplitsRepo{
  Future<Either<Failure,ListSplitsResponse>> listSplits();
}
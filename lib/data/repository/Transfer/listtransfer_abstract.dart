import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Transfer/ListTransfersResponse.dart';

abstract class ListTransferRepo{
  Future<Either<Failure,ListTransfersResponse>> listTransfer();
}
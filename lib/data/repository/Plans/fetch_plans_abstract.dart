import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Payment%20Pages/FetchPaymentPagesResponse.dart';

abstract class FetchPlansRepo{
  Future<Either<Failure, FetchPaymentPagesResponse>> unregisteredDomain();
}
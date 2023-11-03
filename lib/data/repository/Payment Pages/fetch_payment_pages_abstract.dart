
import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Payment%20Pages/FetchPaymentPagesResponse.dart';

abstract class FetchPaymentPageRepo{
  Future<Either<Failure, FetchPaymentPagesResponse>> fetchPaymentPage(
);
}
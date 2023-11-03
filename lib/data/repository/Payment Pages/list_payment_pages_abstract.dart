import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Payment%20Pages/ListPaymentPagesResponse.dart';

abstract class ListPaymentPagesRepo{
  Future<Either<Failure, ListPaymentPagesResponse>> listpaymentpages(
);
}
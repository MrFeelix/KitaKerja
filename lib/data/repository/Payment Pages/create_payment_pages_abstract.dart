import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/body/Payment%20Pages/CreatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/CreatePaymentPageResponse.dart';

abstract class CreatePaymentPagesRepo{
    Future<Either<Failure, CreatePaymentPageResponse>> createpaymentpages({
      required CreatePaymentPage payload,
  });
}
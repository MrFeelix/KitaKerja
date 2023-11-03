import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/body/Payment%20Pages/UpdatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/UpdatePaymentPageResponse.dart';

abstract class UpdatePaymentPageRepo{
  Future<Either<Failure, UpdatePaymentPageResponse>> unregisteredDomain({
      required UpdatePaymentPage payload,
  });
}
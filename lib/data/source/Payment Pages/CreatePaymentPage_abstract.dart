import 'package:kitakerja/models/body/Payment%20Pages/CreatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/CreatePaymentPageResponse.dart';

abstract class CreatePaymentPages{
  Future<CreatePaymentPageResponse> createPaymentPages({
    required CreatePaymentPage payload
  });
}
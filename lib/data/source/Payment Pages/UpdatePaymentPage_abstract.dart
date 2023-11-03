import 'package:kitakerja/models/body/Payment%20Pages/UpdatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/UpdatePaymentPageResponse.dart';

abstract class UpdatePayment{
  Future<UpdatePaymentPageResponse>updatePayment({
    required UpdatePaymentPage payload
  });
}
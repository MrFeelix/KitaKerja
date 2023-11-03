import 'package:kitakerja/models/response/Payment%20Pages/FetchPaymentPagesResponse.dart';

abstract class FetchPayment{
  Future<FetchPaymentPagesResponse> fetchPayment();
}
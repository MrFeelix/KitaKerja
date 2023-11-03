import 'package:kitakerja/models/response/Payment%20Pages/ListPaymentPagesResponse.dart';

abstract class ListPayment{
  Future<ListPaymentPagesResponse>listPayment();
}
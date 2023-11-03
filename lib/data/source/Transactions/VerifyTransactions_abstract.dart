import 'package:kitakerja/models/response/Transactions/VerifyTransactionsResponse.dart';

abstract class VerifyTransaction{
  Future<VerifyTransactionsResponse> verifyTransaction();
}
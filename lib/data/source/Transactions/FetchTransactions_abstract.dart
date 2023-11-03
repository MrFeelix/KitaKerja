import 'package:kitakerja/models/response/Transactions/FetchTransactionsResponse.dart';

abstract class FetchTransaction{
  Future<FetchTransactionsResponse> fetchTransaction();
}
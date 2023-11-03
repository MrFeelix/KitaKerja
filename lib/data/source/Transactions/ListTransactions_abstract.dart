import 'package:kitakerja/models/response/Transactions/ListTransactionsResponse.dart';

abstract class ListTransaction{
  Future<ListTransactionsResponse>initialize();
}
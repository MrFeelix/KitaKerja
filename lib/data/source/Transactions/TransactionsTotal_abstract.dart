import 'package:kitakerja/models/response/Transactions/TransactionsTotalResponse.dart';

abstract class TransactionsTotal{
  Future<TransactionsTotalResponse>transactionsTotal();
}
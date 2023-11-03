import 'package:kitakerja/models/body/Transactions/InitializeTransaction.dart';
import 'package:kitakerja/models/response/Transactions/InitializeTransactionsResponse.dart';

abstract class InitializeTransactions{
  Future<InitializeTransactionsResponse>initializeTransaction({
    required InitializeTransaction payload,
  });
}
import 'package:kitakerja/models/response/Transactions/ExportTransactionResponse.dart';

abstract class ExportTransaction{
  Future<ExportTransactionResponse> exportTransaction();
}
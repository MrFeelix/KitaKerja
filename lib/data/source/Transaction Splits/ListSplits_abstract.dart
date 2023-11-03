import 'package:kitakerja/models/response/Transactions%20Splits/ListSplitsResponse.dart';

abstract class ListSplit{
  Future<ListSplitsResponse>listSplit();
}
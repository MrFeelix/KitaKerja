import 'package:kitakerja/models/response/Transfer/ListTransfersResponse.dart';

abstract class ListTransfer{
  Future<ListTransfersResponse> listTransfer();
}
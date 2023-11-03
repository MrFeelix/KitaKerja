import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transactions/ExportTransactionResponse.dart';

import 'ExportTransactions_abstract.dart';

class ExportTransactionSourceImpl implements ExportTransaction{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ExportTransactionSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<ExportTransactionResponse> exportTransaction() async{
    // TODO: implement exportTransaction
    String url = AppEndpoints.exporttransaction;
    final response = await networkRetry.networkRetry(() => networkRequest.get(
      url,
     
      // headers: {
      //   HttpHeaders.authorizationHeader :'Bearer $accessToken',  
      // }
     
    ));
    print(response.body);

    
    final data = await json.decode(response.body);
    if(response.statusCode == 202){
      try{
        final ExportTransactionResponse response = ExportTransactionResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ExportTransactionResponse response = ExportTransactionResponse.fromJson(data);
      try {
        if (response.status == false){
          throw Exception(data ['message']);
        }else {
          final errormessage = data['message'];
          throw Exception(errormessage);

        }
      }on Exception catch (_){
        rethrow;
      }
  }
  }
  
}
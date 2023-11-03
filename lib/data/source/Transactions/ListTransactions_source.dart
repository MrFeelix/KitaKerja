import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transactions/ListTransactionsResponse.dart';

import 'ListTransactions_abstract.dart';

class ListTransactionSourceImpl implements ListTransaction{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ListTransactionSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<ListTransactionsResponse> initialize()async {
    // TODO: implement initialize
    String url = AppEndpoints.listTransaction;
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
        final ListTransactionsResponse response = ListTransactionsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ListTransactionsResponse response = ListTransactionsResponse.fromJson(data);
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
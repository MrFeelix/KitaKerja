import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transactions/FetchTransactionsResponse.dart';

import 'FetchTransactions_abstract.dart';

class FetchTransactionSourceImpl implements FetchTransaction{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  FetchTransactionSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<FetchTransactionsResponse> fetchTransaction() async{
    // TODO: implement fetchTransaction
   String url = AppEndpoints.fetchTransaction;
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
        final FetchTransactionsResponse response = FetchTransactionsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final FetchTransactionsResponse response = FetchTransactionsResponse.fromJson(data);
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
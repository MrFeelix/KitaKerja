import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transactions/VerifyTransactionsResponse.dart';

import 'VerifyTransactions_abstract.dart';

class VerifyTransactionSourceImpl implements VerifyTransaction{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  VerifyTransactionSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<VerifyTransactionsResponse> verifyTransaction()async {
    String url = AppEndpoints.verifyTransaction;
    // TODO: implement verifyTransaction
    final response = await networkRetry.networkRetry(() => networkRequest.get(
      url,
    
      // headers: {
      //   HttpHeaders.authorizationHeader :'Bearer $accessToken',  
      // }
     
    ));

    
    final data = await json.decode(response.body);
    if(response.statusCode == 202){
      try{
        final VerifyTransactionsResponse response = VerifyTransactionsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final VerifyTransactionsResponse response = VerifyTransactionsResponse.fromJson(data);
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
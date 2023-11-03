import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transactions/TransactionsTotalResponse.dart';

import 'TransactionsTotal_abstract.dart';

class TransactionsTotalSourceImpl implements TransactionsTotal{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  TransactionsTotalSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<TransactionsTotalResponse> transactionsTotal()async {
    // TODO: implement transactionsTotal
    String url = AppEndpoints.transactionstotal;
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
        final TransactionsTotalResponse response = TransactionsTotalResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final TransactionsTotalResponse response = TransactionsTotalResponse.fromJson(data);
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
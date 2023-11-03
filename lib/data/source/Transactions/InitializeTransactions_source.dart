import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/body/Transactions/InitializeTransaction.dart';
import 'package:kitakerja/models/response/Transactions/InitializeTransactionsResponse.dart';
import 'InitializeTransactions_abstract.dart';

class InitializeTransactionsSourceImpl implements InitializeTransactions{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  InitializeTransactionsSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });
  
  @override
  Future<InitializeTransactionsResponse> initializeTransaction({required InitializeTransaction payload})async {
    // TODO: implement initializeTransaction
    String url = AppEndpoints.initializeTransaction;
    final body = {
      "amount" : payload.amount,
     "email": payload.email
      
    };
    final response = await networkRetry.networkRetry(() => networkRequest.post(
      url,
      body: body,
      // headers: {
      //   HttpHeaders.authorizationHeader :'Bearer $accessToken',  
      // }
     
    ));
    print(response.body);

    
    final data = await json.decode(response.body);
    if(response.statusCode == 202){
      try{
        final InitializeTransactionsResponse response = InitializeTransactionsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final InitializeTransactionsResponse response = InitializeTransactionsResponse.fromJson(data);
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
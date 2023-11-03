import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transactions/ViewTransactionTimelineResponse.dart';

import 'ViewTransactionsTotal_abstract.dart';

class ViewTransactionTotalSourceImpl implements ViewTransactionTotal{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ViewTransactionTotalSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<ViewTransactionTimelineResponse> viewTransactionTotal()async {
    String url = AppEndpoints.viewTransactionTotal;
    // TODO: implement viewTransactionTotal
    final response = await networkRetry.networkRetry(() => networkRequest.get(
      url,
    
      // headers: {
      //   HttpHeaders.authorizationHeader :'Bearer $accessToken',  
      // }
     
    ));

    
    final data = await json.decode(response.body);
    if(response.statusCode == 202){
      try{
        final ViewTransactionTimelineResponse response = ViewTransactionTimelineResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ViewTransactionTimelineResponse response = ViewTransactionTimelineResponse.fromJson(data);
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
import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Payment%20Pages/FetchPaymentPagesResponse.dart';

import 'FetchPaymentPage_abstract.dart';

class FetchPaymentSourceImpl implements FetchPayment{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  FetchPaymentSourceImpl (
    {
      required this.networkRequest,
      required this.networkRetry,

    }
  );

  @override
  Future<FetchPaymentPagesResponse> fetchPayment() async{
    // TODO: implement fetchPayment
     String url =AppEndpoints.fetchpaymentpage;

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
        final FetchPaymentPagesResponse response = FetchPaymentPagesResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final FetchPaymentPagesResponse response = FetchPaymentPagesResponse.fromJson(data);
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
import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/body/Payment%20Pages/CreatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/CreatePaymentPageResponse.dart';
import 'CreatePaymentPage_abstract.dart';

class CreatePaymentPagesSourceImpl implements CreatePaymentPages{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  CreatePaymentPagesSourceImpl(
    {
      required this.networkRequest,
      required this.networkRetry,
    }
  );
  @override
  Future<CreatePaymentPageResponse> createPaymentPages({required CreatePaymentPage payload}) async{
    // TODO: implement createPaymentPages
     String url =AppEndpoints.createpaymentpage;

    final body = {
      "name" :payload.name,
      "amount" : payload.amount,
      "description" : payload.amount,
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
        final CreatePaymentPageResponse response = CreatePaymentPageResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final CreatePaymentPageResponse response = CreatePaymentPageResponse.fromJson(data);
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
import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/body/Payment%20Pages/UpdatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/UpdatePaymentPageResponse.dart';

import 'UpdatePaymentPage_abstract.dart';

class UpdatePaymentSourceImpl implements UpdatePayment{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  UpdatePaymentSourceImpl(
    {
      required this.networkRequest,
      required this.networkRetry,

    }
  );
  
  @override
  Future<UpdatePaymentPageResponse> updatePayment({required UpdatePaymentPage payload})async {
    // TODO: implement updatePayment
     String url =AppEndpoints.updatepaymentpage;

   final body = {
      "name" :payload.name,
      "amount" : payload.amount,
      "description" : payload.amount,
    };
    final response = await networkRetry.networkRetry(() => networkRequest.put(
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
        final UpdatePaymentPageResponse response = UpdatePaymentPageResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final UpdatePaymentPageResponse response = UpdatePaymentPageResponse.fromJson(data);
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
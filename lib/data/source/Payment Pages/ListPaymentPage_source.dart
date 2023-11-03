import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Payment%20Pages/ListPaymentPagesResponse.dart';

import 'ListPaymentPage_abstract.dart';

class ListPaymentSourceImpl implements ListPayment{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ListPaymentSourceImpl(
    {
      required this.networkRequest,
      required this.networkRetry,
    }
  );

  @override
  Future<ListPaymentPagesResponse> listPayment() async{
    // TODO: implement listPayment
    String url = AppEndpoints.listpaymentpage;

    final response = await networkRetry.networkRetry(() => networkRequest.get(
      url
      
      ));
    print(response.body);

    final data = await json.decode(response.body);
    if(response.statusCode == 202){
      try{
        final ListPaymentPagesResponse response = ListPaymentPagesResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ListPaymentPagesResponse response = ListPaymentPagesResponse.fromJson(data);
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
import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Plans/ListPlansResponse.dart';

import 'ListPlans_abstract.dart';

class ListPlanSourceImpl implements ListPlan{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ListPlanSourceImpl ({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<ListPlansResponse> listPlan()async {
    // TODO: implement listPlan
    String url =AppEndpoints.listplan;

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
        final ListPlansResponse response = ListPlansResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ListPlansResponse response = ListPlansResponse.fromJson(data);
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
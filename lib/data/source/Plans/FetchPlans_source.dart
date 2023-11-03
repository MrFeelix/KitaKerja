import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Plans/FetchPlansResponse.dart';

import 'FetchPlans_abstract.dart';

class FetchPlanSourceImpl implements FetchPlan{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  FetchPlanSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<FetchPlansResponse> fetchPlan()async {
    // TODO: implement fetchPlan
    String url =AppEndpoints.fetchplan;

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
        final FetchPlansResponse response = FetchPlansResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final FetchPlansResponse response = FetchPlansResponse.fromJson(data);
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
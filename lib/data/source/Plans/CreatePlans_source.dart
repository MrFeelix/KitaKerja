import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/body/Plans/Create%20Plans.dart';
import 'package:kitakerja/models/response/Plans/CreatePlansResponse.dart';

import 'CreatePlans_abstract.dart';

class CreatePlanSourceImpl implements CreatePlan{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  CreatePlanSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<CreatePlansResponse> createPlan({required CreatePlans payload})async {
    // TODO: implement createPlan
     String url =AppEndpoints.createplans;

     final body = {
      "name" :payload.name,
      "amount" : payload.amount,
      "description" : payload.amount,
      "interval": payload.interval,
      
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
        final CreatePlansResponse response = CreatePlansResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final CreatePlansResponse response = CreatePlansResponse.fromJson(data);
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
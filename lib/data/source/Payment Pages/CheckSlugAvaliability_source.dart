import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/data/source/Payment%20Pages/CheckSlugAvaliability_abstract.dart';
import 'package:kitakerja/models/response/Payment%20Pages/CheckSlugAvaliabilityResponse.dart';

class CheckSlugSourceImpl implements CheckSlug{
 final NetworkRequest networkRequest;
 final NetworkRetry networkRetry;

 CheckSlugSourceImpl(
  {
    required this.networkRequest,
    required this.networkRetry,
  }
 );

  @override
  Future<CheckSlugAvaliabilityResponse> checkSlugAvaliability()async {
    // TODO: implement checkSlugAvaliability
     String url =AppEndpoints.checkslugavaliability;

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
        final CheckSlugAvaliabilityResponse response = CheckSlugAvaliabilityResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final CheckSlugAvaliabilityResponse response = CheckSlugAvaliabilityResponse.fromJson(data);
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
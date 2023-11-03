import 'dart:convert';
import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/data/source/Plans/UpdatePlans_abstract.dart';
import 'package:kitakerja/models/body/Plans/Update%20Plans.dart';
import 'package:kitakerja/models/response/Plans/UpdatePlansResponse.dart';

class UpdateplanSourceImpl implements Updateplan{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  UpdateplanSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<UpdatePlansResponse> updateplan({required UpdatePlans payload})async {
    // TODO: implement updateplan
    String url = AppEndpoints.updateplan;
   final body ={
    "name" : payload.amount,
    "": payload.interval,
    
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
        final UpdatePlansResponse response = UpdatePlansResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final UpdatePlansResponse response = UpdatePlansResponse.fromJson(data);
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








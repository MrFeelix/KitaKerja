import 'dart:convert';
import 'dart:io';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/body/Apple%20Pay/UnregisterDomain.dart';
import 'package:kitakerja/models/response/Apple%20Pay/UnregisteredDomainResponse.dart';
import 'UnregisterDomain_abstract.dart';

class UnregisterdDomainSourceImpl implements UnregisteredDomain { 
 final NetworkRequest networkRequest;
 final NetworkRetry networkRetry;

 UnregisterdDomainSourceImpl(
  {
    required this.networkRequest,
    required this.networkRetry,
  }
 );
  @override
  Future<UnregisteredDomainResponse> unregisteredDomain({required UnregisterDomain payload})async {
  String url = AppEndpoints.unregisterdomain;
    final body = {
      "domainName" :payload.domainName,
    };
    final response = await networkRetry.networkRetry(() => networkRequest.delete(
      url,
      body: body,
      // headers: {
      //   HttpHeaders.authorizationHeader :'Bearer $accessToken',  
      // }
    
    ));
     final data = await json.decode(response.body);
    if(response.statusCode == 200){
      try{
        final UnregisteredDomainResponse response = UnregisteredDomainResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final UnregisteredDomainResponse response = UnregisteredDomainResponse.fromJson(data);
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
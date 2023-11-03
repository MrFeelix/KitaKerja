import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Terminal/ListTerminalResponse.dart';

import 'ListTerminals_abstract.dart';

class ListTerminalSourceImpl implements ListTerminal{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ListTerminalSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<ListTerminalResponse> listTerminal()async {
    // TODO: implement listTerminal
   String url =AppEndpoints.listTerminal;

    final response = await networkRetry.networkRetry(() => networkRequest.put(
      url,
    
      // headers: {
      //   HttpHeaders.authorizationHeader :'Bearer $accessToken',  
      // }
     
    ));
    print(response.body);

    final data = await json.decode(response.body);
    if(response.statusCode == 202){
      try{
        final ListTerminalResponse response = ListTerminalResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ListTerminalResponse response = ListTerminalResponse.fromJson(data);
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
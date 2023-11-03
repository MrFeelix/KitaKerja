import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transfer/ListTransfersResponse.dart';

import 'ListTransfers_abstract.dart';

class ListTransferSourceImpl implements ListTransfer{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ListTransferSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<ListTransfersResponse> listTransfer() async{
    // TODO: implement listTransfer
    String url = AppEndpoints.transfer;
   final response = await networkRetry.networkRetry(() => networkRequest.get(
      url,
    
      // headers: {
      //   HttpHeaders.authorizationHeader :'Bearer $accessToken',  
      // }
     
    ));

    
    final data = await json.decode(response.body);
    if(response.statusCode == 202){
      try{
        final ListTransfersResponse response = ListTransfersResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ListTransfersResponse response = ListTransfersResponse.fromJson(data);
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
import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Transactions%20Splits/ListSplitsResponse.dart';

import 'ListSplits_abstract.dart';

class ListSplitSourceImpl implements ListSplit{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ListSplitSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<ListSplitsResponse> listSplit()async {
    // TODO: implement listSplit
 String url =AppEndpoints.listSplit;
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
        final ListSplitsResponse response = ListSplitsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ListSplitsResponse response = ListSplitsResponse.fromJson(data);
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
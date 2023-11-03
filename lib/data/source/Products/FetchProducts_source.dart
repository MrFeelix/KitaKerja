import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Products/FetchProductsResponse.dart';

import 'FetchProducts_abstract.dart';

class FetchProductSourceImpl implements FetchProduct{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  FetchProductSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<FetchProductsResponse> fetchProduct() async{
    // TODO: implement fetchProduct
    String url =AppEndpoints.fetchproduct;

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
        final FetchProductsResponse response = FetchProductsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final FetchProductsResponse response = FetchProductsResponse.fromJson(data);
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
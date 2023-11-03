import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/response/Products/ListProductsResponse.dart';

import 'ListProducts_abstract.dart';

class ListProductSourceImpl implements ListProduct{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ListProductSourceImpl({
    required this.networkRequest,
    required this.networkRetry,

  });

  @override
  Future<ListProductsResponse> listProduct() async{
    // TODO: implement listProduct
    String url = AppEndpoints.listproduct;

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
        final ListProductsResponse response = ListProductsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final ListProductsResponse response = ListProductsResponse.fromJson(data);
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
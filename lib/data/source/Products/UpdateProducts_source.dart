import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/body/Products/UpdateProducts.dart';
import 'package:kitakerja/models/response/Products/UpdateProductsResponse.dart';

import 'UpdateProducts_abstract.dart';

class UpdateProductSourceImpl implements UpdateProduct{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  UpdateProductSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });


  @override
  Future<UpdateProductsResponse> updateProduct({required UpdateProducts payload}) async{
    // TODO: implement updateProduct
     String url =AppEndpoints.updateproduct;

    final body = {
      "name" :payload.name,
      "description" : payload.description,
      "price": payload.price,
      "currency": payload.currency,
    
      
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
        final UpdateProductsResponse response = UpdateProductsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final UpdateProductsResponse response = UpdateProductsResponse.fromJson(data);
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
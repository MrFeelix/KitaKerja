import 'dart:convert';

import 'package:kitakerja/constants/app_api_endpoint.dart';
import 'package:kitakerja/core/network/network_request.dart';
import 'package:kitakerja/core/network/network_retry.dart';
import 'package:kitakerja/models/body/Products/CreateProducts.dart';
import 'package:kitakerja/models/response/Products/CreateProductsResponse.dart';

import 'CreateProducts_abstract.dart';

class CreateProductSourceImpl implements CreateProduct{
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  CreateProductSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  
  @override
  Future<CreateProductsResponse> createProduct({required CreateProducts payload})async {
    // TODO: implement createProduct
    String url = AppEndpoints.createproduct;
    final body = {
      "name" :payload.name,
      "amount" : payload.amount,
      "description" : payload.description,
      "price": payload.price,
      "currency": payload.currency,
    
      
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
        final CreateProductsResponse response = CreateProductsResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final CreateProductsResponse response = CreateProductsResponse.fromJson(data);
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
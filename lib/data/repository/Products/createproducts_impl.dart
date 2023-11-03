import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Products/createproducts_abstract.dart';
import 'package:kitakerja/data/source/Products/CreateProducts_abstract.dart';
import 'package:kitakerja/models/body/Products/CreateProducts.dart';
import 'package:kitakerja/models/response/Products/CreateProductsResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class CreateProductsRepoImpl implements CreateProductsRepo{
  final NetworkInfo create;
  final CreateProduct products;

CreateProductsRepoImpl({
  required Ref ref
})
:products = ref.read(createProductsSourceProvider),
create =ref.read(networkInfoProvider);

@override
     Future<Either<Failure, CreateProductsResponse>> createProducts({
      required CreateProducts payload,
  }){
    ServiceRunner<Failure, CreateProductsResponse> sR = ServiceRunner(create);

    return sR.tryRemoteandCatch(
      call: products.createProduct(payload: payload),
      errorTitle: "Error Registering Domain,"
    );
  }
}
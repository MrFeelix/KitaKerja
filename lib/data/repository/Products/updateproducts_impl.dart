import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Products/updateproducts_abstract.dart';
import 'package:kitakerja/data/source/Products/UpdateProducts_abstract.dart';
import 'package:kitakerja/models/body/Products/UpdateProducts.dart';
import 'package:kitakerja/models/response/Products/UpdateProductsResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class UpdateProductsRepoImpl implements UpdateProductsRepo{
  final NetworkInfo net;
  final UpdateProduct netty;
  UpdateProductsRepoImpl({required Ref ref})
      : netty = ref.read(updateProductsSourceProvider),
        net = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, UpdateProductsResponse>> updateProducts({
      required UpdateProducts payload,
  }){
    ServiceRunner<Failure, UpdateProductsResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
      call: netty.updateProduct(payload: payload),
      errorTitle: "Error Registering Domain,"
    );
  }
}
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Products/listproducts_abstract.dart';
import 'package:kitakerja/data/source/Products/ListProducts_abstract.dart';
import 'package:kitakerja/models/response/Products/ListProductsResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class ListProductRepoImpl implements ListProductRepo{
  final NetworkInfo net;
  final ListProduct netty;
  ListProductRepoImpl({required Ref ref})
      : netty = ref.read(listProductsSourceProvider),
        net = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, ListProductsResponse>> listProducts(){
    ServiceRunner<Failure, ListProductsResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
      call: netty.listProduct(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
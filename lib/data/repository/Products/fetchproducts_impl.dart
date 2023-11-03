import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Products/fetchproducts_abstract.dart';
import 'package:kitakerja/data/source/Products/FetchProducts_abstract.dart';
import 'package:kitakerja/models/response/Products/FetchProductsResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

abstract class FetchProductsRepoImpl implements FetchProductsRepo{
  final NetworkInfo fetch;
  final FetchProduct pro;
  FetchProductsRepoImpl({required Ref ref})
  :pro = ref.read(fetchProductsSourceProvider),
  fetch = ref.read(networkInfoProvider);

  @override
        Future<Either<Failure, FetchProductsResponse>> fetchProducs(){
    ServiceRunner<Failure, FetchProductsResponse> sR = ServiceRunner(fetch);

    return sR.tryRemoteandCatch(
      call: pro.fetchProduct(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
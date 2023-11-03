 import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Transfer/listtransfer_abstract.dart';
import 'package:kitakerja/data/source/Transfer/ListTransfers_abstract.dart';
import 'package:kitakerja/models/response/Transfer/ListTransfersResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class ListTransferRepoImpl implements ListTransferRepo{
  final NetworkInfo list;
  final ListTransfer trans;
  ListTransferRepoImpl({required Ref ref})
      : trans = ref.read(listTransferSourceProvider),
        list = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, ListTransfersResponse>> listTransfer(){
    ServiceRunner<Failure, ListTransfersResponse> sR = ServiceRunner(list);

    return sR.tryRemoteandCatch(
      call: trans.listTransfer(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
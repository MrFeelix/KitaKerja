import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Transaction%20Splits/listsplits_abstract.dart';
import 'package:kitakerja/data/source/Transaction%20Splits/ListSplits_abstract.dart';
import 'package:kitakerja/models/response/Transactions%20Splits/ListSplitsResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class ListSplitsRepoImpl implements ListSplitsRepo{
  final NetworkInfo check;
  final ListSplit slug;
  ListSplitsRepoImpl({required Ref ref})
      : slug = ref.read(listSplitsSourceProvider),
        check = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, ListSplitsResponse>> listSplits(){
    ServiceRunner<Failure, ListSplitsResponse> sR = ServiceRunner(check);

    return sR.tryRemoteandCatch(
      call: slug.listSplit(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
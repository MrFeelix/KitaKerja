import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/data/repository/Plans/fetch_plans_abstract.dart';
import 'package:kitakerja/data/source/Plans/FetchPlans_abstract.dart';
import 'package:kitakerja/models/response/Plans/FetchPlansResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

import '../../../core/runner/service.dart';

abstract class  FetchPlansRepoImpl implements FetchPlansRepo{
  final NetworkInfo net;
  final FetchPlan netty;
  FetchPlansRepoImpl({required Ref ref})
      : netty = ref.read(fetchPlanSourceProvider),
        net = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, FetchPlansResponse>> fetchplans(){
    ServiceRunner<Failure, FetchPlansResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
      call: netty.fetchPlan(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
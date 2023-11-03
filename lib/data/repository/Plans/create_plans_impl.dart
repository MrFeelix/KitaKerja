import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Plans/create_plans_abstract.dart';
import 'package:kitakerja/data/source/Plans/CreatePlans_abstract.dart';
import 'package:kitakerja/models/body/Plans/Create%20Plans.dart';
import 'package:kitakerja/models/response/Plans/CreatePlansResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class CreatelanRepoImpl implements CreatePlansRepo{
  final NetworkInfo net;
  final CreatePlan netty;
  CreatelanRepoImpl({required Ref ref})
      : netty = ref.read(createPlanSourceProvider),
        net = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, CreatePlansResponse>> createPlans({
      required CreatePlans payload,
  }){
    ServiceRunner<Failure, CreatePlansResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
      call: netty.createPlan(payload: payload),
      errorTitle: "Error Registering Domain,"
    );
  }
}
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Plans/list_plans_abstract.dart';
import 'package:kitakerja/data/source/Plans/ListPlans_abstract.dart';
import 'package:kitakerja/models/response/Plans/ListPlansResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

abstract class ListPlanRepoImpl implements ListPlanRepo{
  final NetworkInfo list;
  final ListPlan plan;
  ListPlanRepoImpl({required Ref ref})
      : plan = ref.read(listplanSourceProvider),
        list = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, ListPlansResponse>> listplans(){
    ServiceRunner<Failure, ListPlansResponse> sR = ServiceRunner(list);

    return sR.tryRemoteandCatch(
      call: plan.listPlan(),
      errorTitle: "Error Registering Domain,"
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Payment%20Pages/checkslug_availability_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/CheckSlugAvaliability_abstract.dart';
import 'package:kitakerja/models/response/Payment%20Pages/CheckSlugAvaliabilityResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

abstract class CheckSlugAvaliabilityRepoImpl implements CheckSlugAvaliabilityRepo{
  final NetworkInfo check;
  final CheckSlug slug;
  CheckSlugAvaliabilityRepoImpl({required Ref ref})
      : slug = ref.read(checkSlugAvaliabilitySourceProvider),
        check = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, CheckSlugAvaliabilityResponse>> checkslugavailability(){
    ServiceRunner<Failure, CheckSlugAvaliabilityResponse> sR = ServiceRunner(check);

    return sR.tryRemoteandCatch(
      call: slug.checkSlugAvaliability(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
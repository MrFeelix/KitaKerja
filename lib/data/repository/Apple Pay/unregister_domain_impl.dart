import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Apple%20Pay/unregister_domain_abstract.dart';
import 'package:kitakerja/data/source/Apple%20Pay/UnregisterDomain_abstract.dart';
import 'package:kitakerja/models/body/Apple%20Pay/UnregisterDomain.dart';
import 'package:kitakerja/models/response/Apple%20Pay/UnregisteredDomainResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class UnregisterDomainRepoImpl implements UnregisterDomainRepo{
  final NetworkInfo net;
  final UnregisteredDomain netty;
  UnregisterDomainRepoImpl({required Ref ref})
      : netty = ref.read(unregisterDomainSourceProvider),
        net = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, UnregisteredDomainResponse>> unregisteredDomain({
      required UnregisterDomain payload,
  }){
    ServiceRunner<Failure, UnregisteredDomainResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
      call: netty.unregisteredDomain(payload: payload),
      errorTitle: "Error Registering Domain,"
    );
  }
}
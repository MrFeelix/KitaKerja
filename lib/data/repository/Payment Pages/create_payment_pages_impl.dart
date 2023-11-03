import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Payment%20Pages/create_payment_pages_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/CreatePaymentPage_abstract.dart';
import 'package:kitakerja/models/body/Payment%20Pages/CreatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/CreatePaymentPageResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

class  CreatePaymentRepoImpl implements CreatePaymentPagesRepo{
  final NetworkInfo net;
  final CreatePaymentPages netty;
  CreatePaymentRepoImpl({required Ref ref})
      : netty = ref.read(createpaymentpagesSourceProvider),
        net = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, CreatePaymentPageResponse>> createpaymentpages({
      required CreatePaymentPage payload,
  }){
    ServiceRunner<Failure, CreatePaymentPageResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
      call: netty.createPaymentPages(payload: payload),
      errorTitle: "Error Registering Domain,"
    );
  }
}
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Payment%20Pages/update_payment_pages_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/UpdatePaymentPage_abstract.dart';
import 'package:kitakerja/models/body/Payment%20Pages/UpdatePaymentPage.dart';
import 'package:kitakerja/models/response/Payment%20Pages/UpdatePaymentPageResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

abstract class UpdatePaymentPagesRepoImpl implements UpdatePaymentPageRepo{
  final NetworkInfo net;
  final UpdatePayment netty;
  UpdatePaymentPagesRepoImpl({required Ref ref})
      : netty = ref.read(updatepaymentpagesSourceProvider),
        net = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, UpdatePaymentPageResponse>> updatepaymentpages({
      required UpdatePaymentPage payload,
  }){
    ServiceRunner<Failure, UpdatePaymentPageResponse> sR = ServiceRunner(net);

    return sR.tryRemoteandCatch(
      call: netty.updatePayment(payload: payload),
      errorTitle: "Error Registering Domain,"
    );
  }
}
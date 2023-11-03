import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Payment%20Pages/fetch_payment_pages_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/FetchPaymentPage_abstract.dart';
import 'package:kitakerja/models/response/Payment%20Pages/FetchPaymentPagesResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

abstract class FetchPaymentPagesRepoImpl implements FetchPaymentPageRepo{
  final NetworkInfo fetch;
  final FetchPayment payment;
  FetchPaymentPagesRepoImpl({required Ref ref})
      : payment = ref.read(fetchpaymentpagesSourceProvider),
        fetch = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, FetchPaymentPagesResponse>> fetchpaymentpages(){
    ServiceRunner<Failure, FetchPaymentPagesResponse> sR = ServiceRunner(fetch);

    return sR.tryRemoteandCatch(
      call: payment.fetchPayment(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Payment%20Pages/list_payment_pages_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/ListPaymentPage_abstract.dart';
import 'package:kitakerja/models/response/Payment%20Pages/ListPaymentPagesResponse.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

abstract class ListPaymentPagesRepoImpl implements ListPaymentPagesRepo{
  final NetworkInfo list;
  final ListPayment payment;
 ListPaymentPagesRepoImpl({required Ref ref})
      : payment = ref.read(listpaymentpagesSourceProvider),
        list = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, ListPaymentPagesResponse>> listpayment(){
    ServiceRunner<Failure, ListPaymentPagesResponse> sR = ServiceRunner(list);

    return sR.tryRemoteandCatch(
      call: payment.listPayment(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
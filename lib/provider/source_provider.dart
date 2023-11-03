import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/data/source/Apple%20Pay/UnregisterDomain_abstract.dart';
import 'package:kitakerja/data/source/Apple%20Pay/UnregisterDomain_source.dart';
import 'package:kitakerja/data/source/Payment%20Pages/CheckSlugAvaliability_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/CheckSlugAvaliability_source.dart';
import 'package:kitakerja/data/source/Payment%20Pages/CreatePaymentPage_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/CreatePaymentPage_source.dart';
import 'package:kitakerja/data/source/Payment%20Pages/FetchPaymentPage_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/FetchPaymentPage_source.dart';
import 'package:kitakerja/data/source/Payment%20Pages/ListPaymentPage_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/ListPaymentPage_source.dart';
import 'package:kitakerja/data/source/Payment%20Pages/UpdatePaymentPage_abstract.dart';
import 'package:kitakerja/data/source/Payment%20Pages/UpdatePaymentPage_source.dart';
import 'package:kitakerja/data/source/Plans/CreatePlans_abstract.dart';
import 'package:kitakerja/data/source/Plans/CreatePlans_source.dart';
import 'package:kitakerja/data/source/Plans/FetchPlans_abstract.dart';
import 'package:kitakerja/data/source/Plans/FetchPlans_source.dart';
import 'package:kitakerja/data/source/Plans/ListPlans_abstract.dart';
import 'package:kitakerja/data/source/Plans/ListPlans_source.dart';
import 'package:kitakerja/data/source/Plans/UpdatePlans_abstract.dart';
import 'package:kitakerja/data/source/Plans/UpdatePlans_source.dart';
import 'package:kitakerja/data/source/Products/CreateProducts_abstract.dart';
import 'package:kitakerja/data/source/Products/CreateProducts_source.dart';
import 'package:kitakerja/data/source/Products/FetchProducts_abstract.dart';
import 'package:kitakerja/data/source/Products/FetchProducts_source.dart';
import 'package:kitakerja/data/source/Products/ListProducts_abstract.dart';
import 'package:kitakerja/data/source/Products/ListProducts_source.dart';
import 'package:kitakerja/data/source/Products/UpdateProducts_abstract.dart';
import 'package:kitakerja/data/source/Products/UpdateProducts_source.dart';
import 'package:kitakerja/data/source/Terminal/ListTerminals_abstract.dart';
import 'package:kitakerja/data/source/Terminal/ListTerminals_source.dart';
import 'package:kitakerja/data/source/Transaction%20Splits/ListSplits_abstract.dart';
import 'package:kitakerja/data/source/Transaction%20Splits/ListSplits_source.dart';
import 'package:kitakerja/data/source/Transfer/ListTransfers_abstract.dart';
import 'package:kitakerja/data/source/Transfer/ListTransfers_source.dart';
import 'package:kitakerja/provider/network_provider.dart';

  final unregisterDomainSourceProvider = Provider<UnregisteredDomain>(
    (ref) => UnregisterdDomainSourceImpl(
      networkRequest: ref.read(networkRequestProvider),
      networkRetry: ref.read(networkRetryProvider),
    ),
  );

  
final checkSlugAvaliabilitySourceProvider = Provider<CheckSlug>(
  (ref) => CheckSlugSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final createpaymentpagesSourceProvider = Provider<CreatePaymentPages>(
  (ref) => CreatePaymentPagesSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final fetchpaymentpagesSourceProvider = Provider<FetchPayment>(
  (ref) => FetchPaymentSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final listpaymentpagesSourceProvider = Provider<ListPayment>(
  (ref) => ListPaymentSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final updatepaymentpagesSourceProvider = Provider<UpdatePayment>(
  (ref) => UpdatePaymentSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

final createPlanSourceProvider = Provider<CreatePlan>(
  (ref) => CreatePlanSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final fetchPlanSourceProvider = Provider<FetchPlan>(
  (ref) => FetchPlanSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final listplanSourceProvider = Provider<ListPlan>(
  (ref) => ListPlanSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final updateplanSourceProvider = Provider<Updateplan>(
  (ref) => UpdateplanSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final createProductsSourceProvider = Provider<CreateProduct>(
  (ref) => CreateProductSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final fetchProductsSourceProvider = Provider<FetchProduct>(
  (ref) => FetchProductSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final listProductsSourceProvider = Provider<ListProduct>(
  (ref) => ListProductSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final updateProductsSourceProvider = Provider<UpdateProduct>(
  (ref) => UpdateProductSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final listTerminalSourceProvider = Provider<ListTerminal>(
  (ref) => ListTerminalSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final listSplitsSourceProvider = Provider<ListSplit>(
  (ref) => ListSplitSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);
final listTransferSourceProvider = Provider<ListTransfer>(
  (ref) => ListTransferSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kitakerja/core/failures/failures.dart';
// import 'package:kitakerja/core/network/network_info.dart';
// import 'package:kitakerja/core/runner/service.dart';
// import 'package:kitakerja/data/repository/Plans/update_plans_abstract.dart';
// import 'package:kitakerja/data/source/Plans/UpdatePlans_abstract.dart';
// import 'package:kitakerja/models/body/Plans/Update%20Plans.dart';
// import 'package:kitakerja/models/response/Plans/UpdatePlansResponse.dart';
// import 'package:kitakerja/provider/network_provider.dart';
// import 'package:kitakerja/provider/source_provider.dart';

//  class UpdatePlansRepoImpl implements UpdatePlansRepo{
//   final NetworkInfo net;
//   final Updateplan netty;
//   UpdatePlansRepoImpl({required Ref ref})
//       : netty = ref.read(updateplanSourceProvider),
//         net = ref.read(networkInfoProvider);
        
// @override
//         Future<Either<Failure, UpdatePlansResponse>> updatePlans({
//       required UpdatePlans payload,
//   }){
//     ServiceRunner<Failure, UpdatePlansResponse> sR = ServiceRunner(net);

//     return sR.tryRemoteandCatch(
//       call: netty.updateplan(payload: payload),
//       errorTitle: "Error Registering Domain,"
//     );
//   }
// }
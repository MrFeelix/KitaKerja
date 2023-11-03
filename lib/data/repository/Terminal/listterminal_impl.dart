 import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/core/network/network_info.dart';
import 'package:kitakerja/core/runner/service.dart';
import 'package:kitakerja/data/repository/Terminal/listterminal_abstract.dart';
import 'package:kitakerja/data/source/Terminal/ListTerminals_abstract.dart';
import 'package:kitakerja/provider/network_provider.dart';
import 'package:kitakerja/provider/source_provider.dart';

import '../../../models/response/Terminal/ListTerminalResponse.dart';

class ListTerminalRepoImpl implements ListTerminalRepo{
  final NetworkInfo list;
  final ListTerminal terminal;
  ListTerminalRepoImpl({required Ref ref})
      : terminal = ref.read(listTerminalSourceProvider),
        list = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, ListTerminalResponse>> listTerminal(){
    ServiceRunner<Failure, ListTerminalResponse> sR = ServiceRunner(list);

    return sR.tryRemoteandCatch(
      call: terminal.listTerminal(),
      errorTitle: "Error Registering Domain,"
    );
  }
}
import 'package:kitakerja/models/body/Apple%20Pay/UnregisterDomain.dart';
import 'package:kitakerja/models/response/Apple%20Pay/UnregisteredDomainResponse.dart';

abstract class UnregisteredDomain{
  Future<UnregisteredDomainResponse> unregisteredDomain({
    required UnregisterDomain payload,
  });
}
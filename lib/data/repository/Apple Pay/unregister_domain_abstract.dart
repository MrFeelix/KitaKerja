import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/body/Apple%20Pay/UnregisterDomain.dart';
import 'package:kitakerja/models/response/Apple%20Pay/UnregisteredDomainResponse.dart';

abstract class UnregisterDomainRepo{
  Future<Either<Failure, UnregisteredDomainResponse>> unregisteredDomain({
      required UnregisterDomain payload,
  });
}
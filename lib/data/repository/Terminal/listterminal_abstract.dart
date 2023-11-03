import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Terminal/ListTerminalResponse.dart';

abstract class ListTerminalRepo{
  Future<Either<Failure, ListTerminalResponse>> listTerminal(
);
}
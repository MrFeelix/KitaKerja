import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Products/ListProductsResponse.dart';

abstract class ListProductRepo{
  Future<Either<Failure, ListProductsResponse>> listProducts();
}
import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/response/Products/FetchProductsResponse.dart';

abstract class FetchProductsRepo{
  Future<Either<Failure, FetchProductsResponse>> fetchProducts();
}
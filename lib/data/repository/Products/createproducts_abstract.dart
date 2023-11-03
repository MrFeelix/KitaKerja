import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/body/Products/CreateProducts.dart';
import 'package:kitakerja/models/response/Products/CreateProductsResponse.dart';

abstract class CreateProductsRepo{
  Future<Either<Failure, CreateProductsResponse>> createProducts({
    required CreateProducts payload,
  });
}
import 'package:dartz/dartz.dart';
import 'package:kitakerja/core/failures/failures.dart';
import 'package:kitakerja/models/body/Products/UpdateProducts.dart';
import '../../../models/response/Products/UpdateProductsResponse.dart';

abstract class UpdateProductsRepo{
  Future<Either<Failure,UpdateProductsResponse>> updateProducts({
   required UpdateProducts payload
  }) ;
}
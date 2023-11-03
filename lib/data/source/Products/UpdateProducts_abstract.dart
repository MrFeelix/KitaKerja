import 'package:kitakerja/models/body/Products/UpdateProducts.dart';
import 'package:kitakerja/models/response/Products/UpdateProductsResponse.dart';

abstract class UpdateProduct{
  Future<UpdateProductsResponse>updateProduct({
    required UpdateProducts payload,
  });
}
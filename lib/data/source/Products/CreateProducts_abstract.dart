import 'package:kitakerja/models/body/Products/CreateProducts.dart';
import 'package:kitakerja/models/response/Products/CreateProductsResponse.dart';

abstract class CreateProduct{
  Future<CreateProductsResponse>createProduct({
    required CreateProducts payload,
  });
}
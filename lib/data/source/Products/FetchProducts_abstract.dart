import 'package:kitakerja/models/response/Products/FetchProductsResponse.dart';

abstract class FetchProduct{
  Future<FetchProductsResponse>fetchProduct();
}
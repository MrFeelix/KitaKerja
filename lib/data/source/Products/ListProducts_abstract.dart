import 'package:kitakerja/models/response/Products/ListProductsResponse.dart';

abstract class ListProduct{
  Future<ListProductsResponse>listProduct();
}
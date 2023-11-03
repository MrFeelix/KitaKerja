import 'package:kitakerja/models/response/Plans/ListPlansResponse.dart';

abstract class ListPlan{
  Future<ListPlansResponse>listPlan();
}
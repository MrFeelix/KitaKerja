import 'package:kitakerja/models/response/Plans/FetchPlansResponse.dart';

abstract class FetchPlan{
  Future<FetchPlansResponse>fetchPlan();
}
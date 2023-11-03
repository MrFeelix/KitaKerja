import 'package:kitakerja/models/body/Plans/Create%20Plans.dart';
import 'package:kitakerja/models/response/Plans/CreatePlansResponse.dart';

abstract class CreatePlan{
  Future<CreatePlansResponse>createPlan({
    required CreatePlans payload,
  });
}
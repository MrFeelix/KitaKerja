import 'package:kitakerja/models/body/Plans/Update%20Plans.dart';
import 'package:kitakerja/models/response/Plans/UpdatePlansResponse.dart';

abstract class Updateplan{
 Future<UpdatePlansResponse>updateplan({
    required UpdatePlans payload
  });
}
import 'package:kitakerja/models/response/Payment%20Pages/CheckSlugAvaliabilityResponse.dart';

abstract class CheckSlug{
  Future<CheckSlugAvaliabilityResponse> checkSlugAvaliability(
  );
}
class UpdatePlans{
  final String name;
  final String interval;
  final int amount;

  UpdatePlans(
    {
      required this.amount,
      required this.interval,
      required this.name,
    }
  );
}
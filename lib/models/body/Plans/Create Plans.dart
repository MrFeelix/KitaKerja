class CreatePlans{
  final String name;
  final String interval;
  final int amount;

  CreatePlans(
    {
      required this.amount,
      required this.interval,
      required this.name,
    }
  );
}
class CreateSplits{
  final String name;
  final String type;
  final String currency;
  final String subaccounts;
  final String bearer_type;
  final String bearer_subaccount;

  CreateSplits(
    {
      required this.bearer_subaccount,
      required this.bearer_type,
      required this.currency,
      required this.subaccounts,
      required this.type,
      required this.name,
    }
  );


}
class PartialDebit{
  final String authtorizationcode;
  final String currency;
  final int amount;
  final String email;
  
  PartialDebit(
    {
      required this.amount,
      required this.authtorizationcode,
      required this.email,
      required this.currency,
    }
  );
}
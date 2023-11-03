class ChargeAuthorization{
  final String email;
  final int amount;
  final String authtorizationcode;

  ChargeAuthorization(
    {
      required this.amount,
      required this.email,
      required this.authtorizationcode
    }
  );
}
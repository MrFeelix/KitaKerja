class CreateProducts{
  final String name;
  final String description;
  final int price;
  final String currency;
  final int amount;


  CreateProducts(
    {
      required this.currency,
      required this.description,
      required this.name,
      required this.price,
      required this.amount,
    }
  );
}
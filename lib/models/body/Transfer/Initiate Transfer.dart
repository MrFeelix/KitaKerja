class InitiateTransfer{
 final String source;
 final String recipient;
 final int amount;


 InitiateTransfer(
  {
    required this.amount,
    required this.recipient,
    required this.source,
  }
 );
}
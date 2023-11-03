class AppEndpoints {
  static const _base = 'https://api.paystack.co';

  ////////////////////////////////////

  // Authentication Endpoint
  static const transfer = '$_base/transfer';
  static const unregisterdomain = '$_base/apple-pay/domain';
  static const checkslugavaliability = '$_base/page/check_slug_availability/:slug';
  static const createpaymentpage = '$_base/page';
  static const fetchpaymentpage = '$_base/page/f7r13msq56';
  static const listpaymentpage = '$_base/page';
  static const updatepaymentpage = '$_base/page/f7r13msq56';
  static const createplans = '$_base/plan';
  static const fetchplan = '$_base/plan/910472';
  static const listplan = '$_base/plan';
  static const updateplan = '$_base/plan/910472';
  static const createproduct = '$_base/product';
  static const fetchproduct = '$_base/product/1306809';
  static const listproduct = '$_base/product';
  static const updateproduct = '$_base/product/1306809';
  static const listTerminal = '$_base/terminal';
  static const listSplit = '$_base/split';
  static const exporttransaction = '$_base/transaction/export';
  static const fetchTransaction = '$_base/transaction/3106248347';
  static const initializeTransaction = '$_base/transaction/initialize';
  static const listTransaction = '$_base/transaction';
  static const transactionstotal = '$_base/transaction/totals';
  static const verifyTransaction = '$_base/transaction/verify/gp5t39y8nf';
  static const viewTransactionTotal = '$_base/transaction/timeline/gp5t39y8nf';
  
}
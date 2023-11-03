// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VerifyTransactionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyTransactionsResponse _$VerifyTransactionsResponseFromJson(Map<String, dynamic> json) =>
    VerifyTransactionsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyTransactionsResponseToJson(VerifyTransactionsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      domain: json['domain'] as String?,
      status: json['status'] as String?,
      reference: json['reference'] as String?,
      receiptNumber: json['receipt_number'],
      amount: json['amount'] as int?,
      message: json['message'],
      gatewayResponse: json['gateway_response'] as String?,
      dataPaidAt: json['paid_at'],
      dataCreatedAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      channel: json['channel'] as String?,
      currency: json['currency'] as String?,
      ipAddress: json['ip_address'] as String?,
      metadata: json['metadata'] as String?,
      log: json['log'],
      fees: json['fees'],
      feesSplit: json['fees_split'],
      authorization: json['authorization'] == null
          ? null
          : Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      plan: json['plan'],
      split: json['split'] == null
          ? null
          : Authorization.fromJson(json['split'] as Map<String, dynamic>),
      orderId: json['order_id'],
      paidAt: json['paidAt'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      requestedAmount: json['requested_amount'] as int?,
      posTransactionData: json['pos_transaction_data'],
      source: json['source'],
      feesBreakdown: json['fees_breakdown'],
      transactionDate: json['transaction_date'] == null
          ? null
          : DateTime.parse(json['transaction_date'] as String),
      planObject: json['plan_object'] == null
          ? null
          : Authorization.fromJson(json['plan_object'] as Map<String, dynamic>),
      subaccount: json['subaccount'] == null
          ? null
          : Authorization.fromJson(json['subaccount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'domain': instance.domain,
      'status': instance.status,
      'reference': instance.reference,
      'receipt_number': instance.receiptNumber,
      'amount': instance.amount,
      'message': instance.message,
      'gateway_response': instance.gatewayResponse,
      'paid_at': instance.dataPaidAt,
      'created_at': instance.dataCreatedAt?.toIso8601String(),
      'channel': instance.channel,
      'currency': instance.currency,
      'ip_address': instance.ipAddress,
      'metadata': instance.metadata,
      'log': instance.log,
      'fees': instance.fees,
      'fees_split': instance.feesSplit,
      'authorization': instance.authorization,
      'customer': instance.customer,
      'plan': instance.plan,
      'split': instance.split,
      'order_id': instance.orderId,
      'paidAt': instance.paidAt,
      'createdAt': instance.createdAt?.toIso8601String(),
      'requested_amount': instance.requestedAmount,
      'pos_transaction_data': instance.posTransactionData,
      'source': instance.source,
      'fees_breakdown': instance.feesBreakdown,
      'transaction_date': instance.transactionDate?.toIso8601String(),
      'plan_object': instance.planObject,
      'subaccount': instance.subaccount,
    };

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) =>
    Authorization();

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{};

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int?,
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'] as String?,
      customerCode: json['customer_code'] as String?,
      phone: json['phone'],
      metadata: json['metadata'],
      riskAction: json['risk_action'] as String?,
      internationalFormatPhone: json['international_format_phone'],
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'customer_code': instance.customerCode,
      'phone': instance.phone,
      'metadata': instance.metadata,
      'risk_action': instance.riskAction,
      'international_format_phone': instance.internationalFormatPhone,
    };

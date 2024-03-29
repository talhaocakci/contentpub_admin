/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Purchase type in your schema. */
@immutable
class Purchase extends Model {
  static const classType = const _PurchaseModelType();
  final String id;
  final TemporalDate? _purchaseTime;
  final TemporalDate? _validTill;
  final Source? _source;
  final String? _stripePaymentIntentId;
  final String? _stripePriceId;
  final PurchaseType? _purchaseType;
  final String? _customerID;
  final Bundle? _bundle;
  final String? _stripeProductId;
  final String? _tenantID;
  final bool? _isActive;
  final TemporalDate? _cancellationDate;
  final double? _amount;
  final String? _currency;
  final String? _subscriptionId;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _purchaseBundleId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PurchaseModelIdentifier get modelIdentifier {
      return PurchaseModelIdentifier(
        id: id
      );
  }
  
  TemporalDate? get purchaseTime {
    return _purchaseTime;
  }
  
  TemporalDate? get validTill {
    return _validTill;
  }
  
  Source? get source {
    return _source;
  }
  
  String? get stripePaymentIntentId {
    return _stripePaymentIntentId;
  }
  
  String? get stripePriceId {
    return _stripePriceId;
  }
  
  PurchaseType? get purchaseType {
    return _purchaseType;
  }
  
  String get customerID {
    try {
      return _customerID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Bundle? get bundle {
    return _bundle;
  }
  
  String? get stripeProductId {
    return _stripeProductId;
  }
  
  String get tenantID {
    try {
      return _tenantID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool? get isActive {
    return _isActive;
  }
  
  TemporalDate? get cancellationDate {
    return _cancellationDate;
  }
  
  double? get amount {
    return _amount;
  }
  
  String? get currency {
    return _currency;
  }
  
  String? get subscriptionId {
    return _subscriptionId;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get purchaseBundleId {
    return _purchaseBundleId;
  }
  
  const Purchase._internal({required this.id, purchaseTime, validTill, source, stripePaymentIntentId, stripePriceId, purchaseType, required customerID, bundle, stripeProductId, required tenantID, isActive, cancellationDate, amount, currency, subscriptionId, createdAt, updatedAt, purchaseBundleId}): _purchaseTime = purchaseTime, _validTill = validTill, _source = source, _stripePaymentIntentId = stripePaymentIntentId, _stripePriceId = stripePriceId, _purchaseType = purchaseType, _customerID = customerID, _bundle = bundle, _stripeProductId = stripeProductId, _tenantID = tenantID, _isActive = isActive, _cancellationDate = cancellationDate, _amount = amount, _currency = currency, _subscriptionId = subscriptionId, _createdAt = createdAt, _updatedAt = updatedAt, _purchaseBundleId = purchaseBundleId;
  
  factory Purchase({String? id, TemporalDate? purchaseTime, TemporalDate? validTill, Source? source, String? stripePaymentIntentId, String? stripePriceId, PurchaseType? purchaseType, required String customerID, Bundle? bundle, String? stripeProductId, required String tenantID, bool? isActive, TemporalDate? cancellationDate, double? amount, String? currency, String? subscriptionId, String? purchaseBundleId}) {
    return Purchase._internal(
      id: id == null ? UUID.getUUID() : id,
      purchaseTime: purchaseTime,
      validTill: validTill,
      source: source,
      stripePaymentIntentId: stripePaymentIntentId,
      stripePriceId: stripePriceId,
      purchaseType: purchaseType,
      customerID: customerID,
      bundle: bundle,
      stripeProductId: stripeProductId,
      tenantID: tenantID,
      isActive: isActive,
      cancellationDate: cancellationDate,
      amount: amount,
      currency: currency,
      subscriptionId: subscriptionId,
      purchaseBundleId: purchaseBundleId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Purchase &&
      id == other.id &&
      _purchaseTime == other._purchaseTime &&
      _validTill == other._validTill &&
      _source == other._source &&
      _stripePaymentIntentId == other._stripePaymentIntentId &&
      _stripePriceId == other._stripePriceId &&
      _purchaseType == other._purchaseType &&
      _customerID == other._customerID &&
      _bundle == other._bundle &&
      _stripeProductId == other._stripeProductId &&
      _tenantID == other._tenantID &&
      _isActive == other._isActive &&
      _cancellationDate == other._cancellationDate &&
      _amount == other._amount &&
      _currency == other._currency &&
      _subscriptionId == other._subscriptionId &&
      _purchaseBundleId == other._purchaseBundleId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Purchase {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("purchaseTime=" + (_purchaseTime != null ? _purchaseTime!.format() : "null") + ", ");
    buffer.write("validTill=" + (_validTill != null ? _validTill!.format() : "null") + ", ");
    buffer.write("source=" + (_source != null ? enumToString(_source)! : "null") + ", ");
    buffer.write("stripePaymentIntentId=" + "$_stripePaymentIntentId" + ", ");
    buffer.write("stripePriceId=" + "$_stripePriceId" + ", ");
    buffer.write("purchaseType=" + (_purchaseType != null ? enumToString(_purchaseType)! : "null") + ", ");
    buffer.write("customerID=" + "$_customerID" + ", ");
    buffer.write("stripeProductId=" + "$_stripeProductId" + ", ");
    buffer.write("tenantID=" + "$_tenantID" + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("cancellationDate=" + (_cancellationDate != null ? _cancellationDate!.format() : "null") + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("subscriptionId=" + "$_subscriptionId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("purchaseBundleId=" + "$_purchaseBundleId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Purchase copyWith({TemporalDate? purchaseTime, TemporalDate? validTill, Source? source, String? stripePaymentIntentId, String? stripePriceId, PurchaseType? purchaseType, String? customerID, Bundle? bundle, String? stripeProductId, String? tenantID, bool? isActive, TemporalDate? cancellationDate, double? amount, String? currency, String? subscriptionId, String? purchaseBundleId}) {
    return Purchase._internal(
      id: id,
      purchaseTime: purchaseTime ?? this.purchaseTime,
      validTill: validTill ?? this.validTill,
      source: source ?? this.source,
      stripePaymentIntentId: stripePaymentIntentId ?? this.stripePaymentIntentId,
      stripePriceId: stripePriceId ?? this.stripePriceId,
      purchaseType: purchaseType ?? this.purchaseType,
      customerID: customerID ?? this.customerID,
      bundle: bundle ?? this.bundle,
      stripeProductId: stripeProductId ?? this.stripeProductId,
      tenantID: tenantID ?? this.tenantID,
      isActive: isActive ?? this.isActive,
      cancellationDate: cancellationDate ?? this.cancellationDate,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      purchaseBundleId: purchaseBundleId ?? this.purchaseBundleId);
  }
  
  Purchase.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _purchaseTime = json['purchaseTime'] != null ? TemporalDate.fromString(json['purchaseTime']) : null,
      _validTill = json['validTill'] != null ? TemporalDate.fromString(json['validTill']) : null,
      _source = enumFromString<Source>(json['source'], Source.values),
      _stripePaymentIntentId = json['stripePaymentIntentId'],
      _stripePriceId = json['stripePriceId'],
      _purchaseType = enumFromString<PurchaseType>(json['purchaseType'], PurchaseType.values),
      _customerID = json['customerID'],
      _bundle = json['bundle']?['serializedData'] != null
        ? Bundle.fromJson(new Map<String, dynamic>.from(json['bundle']['serializedData']))
        : null,
      _stripeProductId = json['stripeProductId'],
      _tenantID = json['tenantID'],
      _isActive = json['isActive'],
      _cancellationDate = json['cancellationDate'] != null ? TemporalDate.fromString(json['cancellationDate']) : null,
      _amount = (json['amount'] as num?)?.toDouble(),
      _currency = json['currency'],
      _subscriptionId = json['subscriptionId'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _purchaseBundleId = json['purchaseBundleId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'purchaseTime': _purchaseTime?.format(), 'validTill': _validTill?.format(), 'source': enumToString(_source), 'stripePaymentIntentId': _stripePaymentIntentId, 'stripePriceId': _stripePriceId, 'purchaseType': enumToString(_purchaseType), 'customerID': _customerID, 'bundle': _bundle?.toJson(), 'stripeProductId': _stripeProductId, 'tenantID': _tenantID, 'isActive': _isActive, 'cancellationDate': _cancellationDate?.format(), 'amount': _amount, 'currency': _currency, 'subscriptionId': _subscriptionId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'purchaseBundleId': _purchaseBundleId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'purchaseTime': _purchaseTime, 'validTill': _validTill, 'source': _source, 'stripePaymentIntentId': _stripePaymentIntentId, 'stripePriceId': _stripePriceId, 'purchaseType': _purchaseType, 'customerID': _customerID, 'bundle': _bundle, 'stripeProductId': _stripeProductId, 'tenantID': _tenantID, 'isActive': _isActive, 'cancellationDate': _cancellationDate, 'amount': _amount, 'currency': _currency, 'subscriptionId': _subscriptionId, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'purchaseBundleId': _purchaseBundleId
  };

  static final QueryModelIdentifier<PurchaseModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<PurchaseModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField PURCHASETIME = QueryField(fieldName: "purchaseTime");
  static final QueryField VALIDTILL = QueryField(fieldName: "validTill");
  static final QueryField SOURCE = QueryField(fieldName: "source");
  static final QueryField STRIPEPAYMENTINTENTID = QueryField(fieldName: "stripePaymentIntentId");
  static final QueryField STRIPEPRICEID = QueryField(fieldName: "stripePriceId");
  static final QueryField PURCHASETYPE = QueryField(fieldName: "purchaseType");
  static final QueryField CUSTOMERID = QueryField(fieldName: "customerID");
  static final QueryField BUNDLE = QueryField(
    fieldName: "bundle",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Bundle'));
  static final QueryField STRIPEPRODUCTID = QueryField(fieldName: "stripeProductId");
  static final QueryField TENANTID = QueryField(fieldName: "tenantID");
  static final QueryField ISACTIVE = QueryField(fieldName: "isActive");
  static final QueryField CANCELLATIONDATE = QueryField(fieldName: "cancellationDate");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField CURRENCY = QueryField(fieldName: "currency");
  static final QueryField SUBSCRIPTIONID = QueryField(fieldName: "subscriptionId");
  static final QueryField PURCHASEBUNDLEID = QueryField(fieldName: "purchaseBundleId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Purchase";
    modelSchemaDefinition.pluralName = "Purchases";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["customerID"], name: "byCustomer"),
      ModelIndex(fields: const ["tenantID"], name: "byTenant")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.PURCHASETIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.VALIDTILL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.SOURCE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.STRIPEPAYMENTINTENTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.STRIPEPRICEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.PURCHASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.CUSTOMERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Purchase.BUNDLE,
      isRequired: false,
      ofModelName: 'Bundle',
      associatedKey: Bundle.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.STRIPEPRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.TENANTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.ISACTIVE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.CANCELLATIONDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.AMOUNT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.CURRENCY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.SUBSCRIPTIONID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Purchase.PURCHASEBUNDLEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _PurchaseModelType extends ModelType<Purchase> {
  const _PurchaseModelType();
  
  @override
  Purchase fromJson(Map<String, dynamic> jsonData) {
    return Purchase.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Purchase';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Purchase] in your schema.
 */
@immutable
class PurchaseModelIdentifier implements ModelIdentifier<Purchase> {
  final String id;

  /** Create an instance of PurchaseModelIdentifier using [id] the primary key. */
  const PurchaseModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'PurchaseModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PurchaseModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
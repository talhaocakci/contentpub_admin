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


/** This is an auto generated class representing the Price type in your schema. */
@immutable
class Price extends Model {
  static const classType = const _PriceModelType();
  final String id;
  final String? _stripePriceId;
  final PurchaseType? _purchaseType;
  final RecurrenceType? _recurrenceType;
  final String? _currency;
  final double? _amount;
  final String? _bundleID;
  final int? _recurrenceInterval;
  final int? _trialPeriod;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PriceModelIdentifier get modelIdentifier {
      return PriceModelIdentifier(
        id: id
      );
  }
  
  String? get stripePriceId {
    return _stripePriceId;
  }
  
  PurchaseType? get purchaseType {
    return _purchaseType;
  }
  
  RecurrenceType? get recurrenceType {
    return _recurrenceType;
  }
  
  String? get currency {
    return _currency;
  }
  
  double? get amount {
    return _amount;
  }
  
  String get bundleID {
    try {
      return _bundleID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get recurrenceInterval {
    return _recurrenceInterval;
  }
  
  int? get trialPeriod {
    return _trialPeriod;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Price._internal({required this.id, stripePriceId, purchaseType, recurrenceType, currency, amount, required bundleID, recurrenceInterval, trialPeriod, createdAt, updatedAt}): _stripePriceId = stripePriceId, _purchaseType = purchaseType, _recurrenceType = recurrenceType, _currency = currency, _amount = amount, _bundleID = bundleID, _recurrenceInterval = recurrenceInterval, _trialPeriod = trialPeriod, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Price({String? id, String? stripePriceId, PurchaseType? purchaseType, RecurrenceType? recurrenceType, String? currency, double? amount, required String bundleID, int? recurrenceInterval, int? trialPeriod}) {
    return Price._internal(
      id: id == null ? UUID.getUUID() : id,
      stripePriceId: stripePriceId,
      purchaseType: purchaseType,
      recurrenceType: recurrenceType,
      currency: currency,
      amount: amount,
      bundleID: bundleID,
      recurrenceInterval: recurrenceInterval,
      trialPeriod: trialPeriod);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Price &&
      id == other.id &&
      _stripePriceId == other._stripePriceId &&
      _purchaseType == other._purchaseType &&
      _recurrenceType == other._recurrenceType &&
      _currency == other._currency &&
      _amount == other._amount &&
      _bundleID == other._bundleID &&
      _recurrenceInterval == other._recurrenceInterval &&
      _trialPeriod == other._trialPeriod;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Price {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("stripePriceId=" + "$_stripePriceId" + ", ");
    buffer.write("purchaseType=" + (_purchaseType != null ? enumToString(_purchaseType)! : "null") + ", ");
    buffer.write("recurrenceType=" + (_recurrenceType != null ? enumToString(_recurrenceType)! : "null") + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("bundleID=" + "$_bundleID" + ", ");
    buffer.write("recurrenceInterval=" + (_recurrenceInterval != null ? _recurrenceInterval!.toString() : "null") + ", ");
    buffer.write("trialPeriod=" + (_trialPeriod != null ? _trialPeriod!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Price copyWith({String? stripePriceId, PurchaseType? purchaseType, RecurrenceType? recurrenceType, String? currency, double? amount, String? bundleID, int? recurrenceInterval, int? trialPeriod}) {
    return Price._internal(
      id: id,
      stripePriceId: stripePriceId ?? this.stripePriceId,
      purchaseType: purchaseType ?? this.purchaseType,
      recurrenceType: recurrenceType ?? this.recurrenceType,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      bundleID: bundleID ?? this.bundleID,
      recurrenceInterval: recurrenceInterval ?? this.recurrenceInterval,
      trialPeriod: trialPeriod ?? this.trialPeriod);
  }
  
  Price.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _stripePriceId = json['stripePriceId'],
      _purchaseType = enumFromString<PurchaseType>(json['purchaseType'], PurchaseType.values),
      _recurrenceType = enumFromString<RecurrenceType>(json['recurrenceType'], RecurrenceType.values),
      _currency = json['currency'],
      _amount = (json['amount'] as num?)?.toDouble(),
      _bundleID = json['bundleID'],
      _recurrenceInterval = (json['recurrenceInterval'] as num?)?.toInt(),
      _trialPeriod = (json['trialPeriod'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'stripePriceId': _stripePriceId, 'purchaseType': enumToString(_purchaseType), 'recurrenceType': enumToString(_recurrenceType), 'currency': _currency, 'amount': _amount, 'bundleID': _bundleID, 'recurrenceInterval': _recurrenceInterval, 'trialPeriod': _trialPeriod, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'stripePriceId': _stripePriceId, 'purchaseType': _purchaseType, 'recurrenceType': _recurrenceType, 'currency': _currency, 'amount': _amount, 'bundleID': _bundleID, 'recurrenceInterval': _recurrenceInterval, 'trialPeriod': _trialPeriod, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<PriceModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<PriceModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STRIPEPRICEID = QueryField(fieldName: "stripePriceId");
  static final QueryField PURCHASETYPE = QueryField(fieldName: "purchaseType");
  static final QueryField RECURRENCETYPE = QueryField(fieldName: "recurrenceType");
  static final QueryField CURRENCY = QueryField(fieldName: "currency");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField BUNDLEID = QueryField(fieldName: "bundleID");
  static final QueryField RECURRENCEINTERVAL = QueryField(fieldName: "recurrenceInterval");
  static final QueryField TRIALPERIOD = QueryField(fieldName: "trialPeriod");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Price";
    modelSchemaDefinition.pluralName = "Prices";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["bundleID"], name: "byBundle")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.STRIPEPRICEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.PURCHASETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.RECURRENCETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.CURRENCY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.AMOUNT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.BUNDLEID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.RECURRENCEINTERVAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Price.TRIALPERIOD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
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
  });
}

class _PriceModelType extends ModelType<Price> {
  const _PriceModelType();
  
  @override
  Price fromJson(Map<String, dynamic> jsonData) {
    return Price.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Price';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Price] in your schema.
 */
@immutable
class PriceModelIdentifier implements ModelIdentifier<Price> {
  final String id;

  /** Create an instance of PriceModelIdentifier using [id] the primary key. */
  const PriceModelIdentifier({
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
  String toString() => 'PriceModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PriceModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
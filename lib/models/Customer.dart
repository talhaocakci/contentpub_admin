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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Customer type in your schema. */
@immutable
class Customer extends Model {
  static const classType = const _CustomerModelType();
  final String id;
  final String? _userName;
  final String? _stripeId;
  final TemporalDate? _createDate;
  final List<Purchase>? _purchases;
  final String? _email;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  CustomerModelIdentifier get modelIdentifier {
    return CustomerModelIdentifier(id: id);
  }

  String? get userName {
    return _userName;
  }

  String? get stripeId {
    return _stripeId;
  }

  TemporalDate? get createDate {
    return _createDate;
  }

  List<Purchase>? get purchases {
    return _purchases;
  }

  String? get email {
    return _email;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Customer._internal(
      {required this.id,
      userName,
      stripeId,
      createDate,
      purchases,
      email,
      createdAt,
      updatedAt})
      : _userName = userName,
        _stripeId = stripeId,
        _createDate = createDate,
        _purchases = purchases,
        _email = email,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Customer(
      {String? id,
      String? userName,
      String? stripeId,
      TemporalDate? createDate,
      List<Purchase>? purchases,
      String? email}) {
    return Customer._internal(
        id: id == null ? UUID.getUUID() : id,
        userName: userName,
        stripeId: stripeId,
        createDate: createDate,
        purchases: purchases != null
            ? List<Purchase>.unmodifiable(purchases)
            : purchases,
        email: email);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customer &&
        id == other.id &&
        _userName == other._userName &&
        _stripeId == other._stripeId &&
        _createDate == other._createDate &&
        DeepCollectionEquality().equals(_purchases, other._purchases) &&
        _email == other._email;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Customer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("stripeId=" + "$_stripeId" + ", ");
    buffer.write("createDate=" +
        (_createDate != null ? _createDate!.format() : "null") +
        ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Customer copyWith(
      {String? userName,
      String? stripeId,
      TemporalDate? createDate,
      List<Purchase>? purchases,
      String? email}) {
    return Customer._internal(
        id: id,
        userName: userName ?? this.userName,
        stripeId: stripeId ?? this.stripeId,
        createDate: createDate ?? this.createDate,
        purchases: purchases ?? this.purchases,
        email: email ?? this.email);
  }

  Customer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _userName = json['userName'],
        _stripeId = json['stripeId'],
        _createDate = json['createDate'] != null
            ? TemporalDate.fromString(json['createDate'])
            : null,
        _purchases = json['purchases']['items'] is List
            ? (json['purchases']['items'] as List)
                //.where((e) => e?['serializedData'] != null)
                .map((e) => Purchase.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        _email = json['email'],
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': _userName,
        'stripeId': _stripeId,
        'createDate': _createDate?.format(),
        'purchases': _purchases?.map((Purchase? e) => e?.toJson()).toList(),
        'email': _email,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'userName': _userName,
        'stripeId': _stripeId,
        'createDate': _createDate,
        'purchases': _purchases,
        'email': _email,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final QueryModelIdentifier<CustomerModelIdentifier> MODEL_IDENTIFIER =
      QueryModelIdentifier<CustomerModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField STRIPEID = QueryField(fieldName: "stripeId");
  static final QueryField CREATEDATE = QueryField(fieldName: "createDate");
  static final QueryField PURCHASES = QueryField(
      fieldName: "purchases",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Purchase).toString()));
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Customer";
    modelSchemaDefinition.pluralName = "Customers";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Customer.USERNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Customer.STRIPEID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Customer.CREATEDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Customer.PURCHASES,
        isRequired: false,
        ofModelName: (Purchase).toString(),
        associatedKey: Purchase.CUSTOMERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Customer.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _CustomerModelType extends ModelType<Customer> {
  const _CustomerModelType();

  @override
  Customer fromJson(Map<String, dynamic> jsonData) {
    return Customer.fromJson(jsonData);
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Customer] in your schema.
 */
@immutable
class CustomerModelIdentifier implements ModelIdentifier<Customer> {
  final String id;

  /** Create an instance of CustomerModelIdentifier using [id] the primary key. */
  const CustomerModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'CustomerModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is CustomerModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

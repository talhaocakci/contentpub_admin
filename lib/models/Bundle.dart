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


/** This is an auto generated class representing the Bundle type in your schema. */
@immutable
class Bundle extends Model {
  static const classType = const _BundleModelType();
  final String id;
  final String? _name;
  final String? _description;
  final bool? _isFree;
  final List<BundleContent>? _contents;
  final List<Price>? _prices;
  final bool? _isAllAccess;
  final String? _stripeProductId;
  final bool? _isAllCourses;
  final bool? _isAllDocuments;
  final bool? _isPublished;
  final bool? _isArchived;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  BundleModelIdentifier get modelIdentifier {
      return BundleModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  String? get description {
    return _description;
  }
  
  bool? get isFree {
    return _isFree;
  }
  
  List<BundleContent>? get contents {
    return _contents;
  }
  
  List<Price>? get prices {
    return _prices;
  }
  
  bool? get isAllAccess {
    return _isAllAccess;
  }
  
  String? get stripeProductId {
    return _stripeProductId;
  }
  
  bool? get isAllCourses {
    return _isAllCourses;
  }
  
  bool? get isAllDocuments {
    return _isAllDocuments;
  }
  
  bool? get isPublished {
    return _isPublished;
  }
  
  bool? get isArchived {
    return _isArchived;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Bundle._internal({required this.id, name, description, isFree, contents, prices, isAllAccess, stripeProductId, isAllCourses, isAllDocuments, isPublished, isArchived, createdAt, updatedAt}): _name = name, _description = description, _isFree = isFree, _contents = contents, _prices = prices, _isAllAccess = isAllAccess, _stripeProductId = stripeProductId, _isAllCourses = isAllCourses, _isAllDocuments = isAllDocuments, _isPublished = isPublished, _isArchived = isArchived, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Bundle({String? id, String? name, String? description, bool? isFree, List<BundleContent>? contents, List<Price>? prices, bool? isAllAccess, String? stripeProductId, bool? isAllCourses, bool? isAllDocuments, bool? isPublished, bool? isArchived}) {
    return Bundle._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      description: description,
      isFree: isFree,
      contents: contents != null ? List<BundleContent>.unmodifiable(contents) : contents,
      prices: prices != null ? List<Price>.unmodifiable(prices) : prices,
      isAllAccess: isAllAccess,
      stripeProductId: stripeProductId,
      isAllCourses: isAllCourses,
      isAllDocuments: isAllDocuments,
      isPublished: isPublished,
      isArchived: isArchived);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bundle &&
      id == other.id &&
      _name == other._name &&
      _description == other._description &&
      _isFree == other._isFree &&
      DeepCollectionEquality().equals(_contents, other._contents) &&
      DeepCollectionEquality().equals(_prices, other._prices) &&
      _isAllAccess == other._isAllAccess &&
      _stripeProductId == other._stripeProductId &&
      _isAllCourses == other._isAllCourses &&
      _isAllDocuments == other._isAllDocuments &&
      _isPublished == other._isPublished &&
      _isArchived == other._isArchived;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Bundle {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("isFree=" + (_isFree != null ? _isFree!.toString() : "null") + ", ");
    buffer.write("isAllAccess=" + (_isAllAccess != null ? _isAllAccess!.toString() : "null") + ", ");
    buffer.write("stripeProductId=" + "$_stripeProductId" + ", ");
    buffer.write("isAllCourses=" + (_isAllCourses != null ? _isAllCourses!.toString() : "null") + ", ");
    buffer.write("isAllDocuments=" + (_isAllDocuments != null ? _isAllDocuments!.toString() : "null") + ", ");
    buffer.write("isPublished=" + (_isPublished != null ? _isPublished!.toString() : "null") + ", ");
    buffer.write("isArchived=" + (_isArchived != null ? _isArchived!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Bundle copyWith({String? name, String? description, bool? isFree, List<BundleContent>? contents, List<Price>? prices, bool? isAllAccess, String? stripeProductId, bool? isAllCourses, bool? isAllDocuments, bool? isPublished, bool? isArchived}) {
    return Bundle._internal(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      isFree: isFree ?? this.isFree,
      contents: contents ?? this.contents,
      prices: prices ?? this.prices,
      isAllAccess: isAllAccess ?? this.isAllAccess,
      stripeProductId: stripeProductId ?? this.stripeProductId,
      isAllCourses: isAllCourses ?? this.isAllCourses,
      isAllDocuments: isAllDocuments ?? this.isAllDocuments,
      isPublished: isPublished ?? this.isPublished,
      isArchived: isArchived ?? this.isArchived);
  }
  
  Bundle.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _description = json['description'],
      _isFree = json['isFree'],
      _contents = json['contents'] is List
        ? (json['contents'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => BundleContent.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _prices = json['prices'] is List
        ? (json['prices'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Price.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _isAllAccess = json['isAllAccess'],
      _stripeProductId = json['stripeProductId'],
      _isAllCourses = json['isAllCourses'],
      _isAllDocuments = json['isAllDocuments'],
      _isPublished = json['isPublished'],
      _isArchived = json['isArchived'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'description': _description, 'isFree': _isFree, 'contents': _contents?.map((BundleContent? e) => e?.toJson()).toList(), 'prices': _prices?.map((Price? e) => e?.toJson()).toList(), 'isAllAccess': _isAllAccess, 'stripeProductId': _stripeProductId, 'isAllCourses': _isAllCourses, 'isAllDocuments': _isAllDocuments, 'isPublished': _isPublished, 'isArchived': _isArchived, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'description': _description, 'isFree': _isFree, 'contents': _contents, 'prices': _prices, 'isAllAccess': _isAllAccess, 'stripeProductId': _stripeProductId, 'isAllCourses': _isAllCourses, 'isAllDocuments': _isAllDocuments, 'isPublished': _isPublished, 'isArchived': _isArchived, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<BundleModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<BundleModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField ISFREE = QueryField(fieldName: "isFree");
  static final QueryField CONTENTS = QueryField(
    fieldName: "contents",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'BundleContent'));
  static final QueryField PRICES = QueryField(
    fieldName: "prices",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Price'));
  static final QueryField ISALLACCESS = QueryField(fieldName: "isAllAccess");
  static final QueryField STRIPEPRODUCTID = QueryField(fieldName: "stripeProductId");
  static final QueryField ISALLCOURSES = QueryField(fieldName: "isAllCourses");
  static final QueryField ISALLDOCUMENTS = QueryField(fieldName: "isAllDocuments");
  static final QueryField ISPUBLISHED = QueryField(fieldName: "isPublished");
  static final QueryField ISARCHIVED = QueryField(fieldName: "isArchived");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Bundle";
    modelSchemaDefinition.pluralName = "Bundles";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        provider: AuthRuleProvider.IAM,
        operations: [
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.ISFREE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Bundle.CONTENTS,
      isRequired: false,
      ofModelName: 'BundleContent',
      associatedKey: BundleContent.BUNDLE
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Bundle.PRICES,
      isRequired: false,
      ofModelName: 'Price',
      associatedKey: Price.BUNDLEID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.ISALLACCESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.STRIPEPRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.ISALLCOURSES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.ISALLDOCUMENTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.ISPUBLISHED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Bundle.ISARCHIVED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
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

class _BundleModelType extends ModelType<Bundle> {
  const _BundleModelType();
  
  @override
  Bundle fromJson(Map<String, dynamic> jsonData) {
    return Bundle.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Bundle';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Bundle] in your schema.
 */
@immutable
class BundleModelIdentifier implements ModelIdentifier<Bundle> {
  final String id;

  /** Create an instance of BundleModelIdentifier using [id] the primary key. */
  const BundleModelIdentifier({
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
  String toString() => 'BundleModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is BundleModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
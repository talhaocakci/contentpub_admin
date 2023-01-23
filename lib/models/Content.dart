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


/** This is an auto generated class representing the Content type in your schema. */
@immutable
class Content extends Model {
  static const classType = const _ContentModelType();
  final String id;
  final String? _name;
  final String? _description;
  final String? _s3Url;
  final ContentType? _type;
  final String? _objectId;
  final String? _owner;
  final Bundle? _bundles;
  final List<ContentCoworker>? _coworkers;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ContentModelIdentifier get modelIdentifier {
      return ContentModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  String? get description {
    return _description;
  }
  
  String? get s3Url {
    return _s3Url;
  }
  
  ContentType? get type {
    return _type;
  }
  
  String? get objectId {
    return _objectId;
  }
  
  String? get owner {
    return _owner;
  }
  
  Bundle? get bundles {
    return _bundles;
  }
  
  List<ContentCoworker>? get coworkers {
    return _coworkers;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Content._internal({required this.id, name, description, s3Url, type, objectId, owner, bundles, coworkers, createdAt, updatedAt}): _name = name, _description = description, _s3Url = s3Url, _type = type, _objectId = objectId, _owner = owner, _bundles = bundles, _coworkers = coworkers, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Content({String? id, String? name, String? description, String? s3Url, ContentType? type, String? objectId, String? owner, Bundle? bundles, List<ContentCoworker>? coworkers}) {
    return Content._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      description: description,
      s3Url: s3Url,
      type: type,
      objectId: objectId,
      owner: owner,
      bundles: bundles,
      coworkers: coworkers != null ? List<ContentCoworker>.unmodifiable(coworkers) : coworkers);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Content &&
      id == other.id &&
      _name == other._name &&
      _description == other._description &&
      _s3Url == other._s3Url &&
      _type == other._type &&
      _objectId == other._objectId &&
      _owner == other._owner &&
      _bundles == other._bundles &&
      DeepCollectionEquality().equals(_coworkers, other._coworkers);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Content {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("s3Url=" + "$_s3Url" + ", ");
    buffer.write("type=" + (_type != null ? enumToString(_type)! : "null") + ", ");
    buffer.write("objectId=" + "$_objectId" + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("bundles=" + (_bundles != null ? _bundles!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Content copyWith({String? name, String? description, String? s3Url, ContentType? type, String? objectId, String? owner, Bundle? bundles, List<ContentCoworker>? coworkers}) {
    return Content._internal(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      s3Url: s3Url ?? this.s3Url,
      type: type ?? this.type,
      objectId: objectId ?? this.objectId,
      owner: owner ?? this.owner,
      bundles: bundles ?? this.bundles,
      coworkers: coworkers ?? this.coworkers);
  }
  
  Content.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _description = json['description'],
      _s3Url = json['s3Url'],
      _type = enumFromString<ContentType>(json['type'], ContentType.values),
      _objectId = json['objectId'],
      _owner = json['owner'],
      _bundles = json['bundles']?['serializedData'] != null
        ? Bundle.fromJson(new Map<String, dynamic>.from(json['bundles']['serializedData']))
        : null,
      _coworkers = json['coworkers'] is List
        ? (json['coworkers'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ContentCoworker.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'description': _description, 's3Url': _s3Url, 'type': enumToString(_type), 'objectId': _objectId, 'owner': _owner, 'bundles': _bundles?.toJson(), 'coworkers': _coworkers?.map((ContentCoworker? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'description': _description, 's3Url': _s3Url, 'type': _type, 'objectId': _objectId, 'owner': _owner, 'bundles': _bundles, 'coworkers': _coworkers, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ContentModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ContentModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField S3URL = QueryField(fieldName: "s3Url");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField OBJECTID = QueryField(fieldName: "objectId");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static final QueryField BUNDLES = QueryField(
    fieldName: "bundles",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Bundle).toString()));
  static final QueryField COWORKERS = QueryField(
    fieldName: "coworkers",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ContentCoworker).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Content";
    modelSchemaDefinition.pluralName = "Contents";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.S3URL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.OBJECTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.OWNER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Content.BUNDLES,
      isRequired: false,
      targetNames: ["bundleContentsId"],
      ofModelName: (Bundle).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Content.COWORKERS,
      isRequired: false,
      ofModelName: (ContentCoworker).toString(),
      associatedKey: ContentCoworker.CONTENT
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

class _ContentModelType extends ModelType<Content> {
  const _ContentModelType();
  
  @override
  Content fromJson(Map<String, dynamic> jsonData) {
    return Content.fromJson(jsonData);
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Content] in your schema.
 */
@immutable
class ContentModelIdentifier implements ModelIdentifier<Content> {
  final String id;

  /** Create an instance of ContentModelIdentifier using [id] the primary key. */
  const ContentModelIdentifier({
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
  String toString() => 'ContentModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ContentModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
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


/** This is an auto generated class representing the Coworker type in your schema. */
@immutable
class Coworker extends Model {
  static const classType = const _CoworkerModelType();
  final String id;
  final String? _email;
  final String? _displayName;
  final String? _photoUrl;
  final String? _description;
  final List<ContentCoworker>? _contents;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CoworkerModelIdentifier get modelIdentifier {
      return CoworkerModelIdentifier(
        id: id
      );
  }
  
  String? get email {
    return _email;
  }
  
  String? get displayName {
    return _displayName;
  }
  
  String? get photoUrl {
    return _photoUrl;
  }
  
  String? get description {
    return _description;
  }
  
  List<ContentCoworker>? get contents {
    return _contents;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Coworker._internal({required this.id, email, displayName, photoUrl, description, contents, createdAt, updatedAt}): _email = email, _displayName = displayName, _photoUrl = photoUrl, _description = description, _contents = contents, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Coworker({String? id, String? email, String? displayName, String? photoUrl, String? description, List<ContentCoworker>? contents}) {
    return Coworker._internal(
      id: id == null ? UUID.getUUID() : id,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      description: description,
      contents: contents != null ? List<ContentCoworker>.unmodifiable(contents) : contents);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Coworker &&
      id == other.id &&
      _email == other._email &&
      _displayName == other._displayName &&
      _photoUrl == other._photoUrl &&
      _description == other._description &&
      DeepCollectionEquality().equals(_contents, other._contents);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Coworker {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("displayName=" + "$_displayName" + ", ");
    buffer.write("photoUrl=" + "$_photoUrl" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Coworker copyWith({String? email, String? displayName, String? photoUrl, String? description, List<ContentCoworker>? contents}) {
    return Coworker._internal(
      id: id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      description: description ?? this.description,
      contents: contents ?? this.contents);
  }
  
  Coworker.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _displayName = json['displayName'],
      _photoUrl = json['photoUrl'],
      _description = json['description'],
      _contents = json['contents'] is List
        ? (json['contents'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ContentCoworker.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'displayName': _displayName, 'photoUrl': _photoUrl, 'description': _description, 'contents': _contents?.map((ContentCoworker? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'email': _email, 'displayName': _displayName, 'photoUrl': _photoUrl, 'description': _description, 'contents': _contents, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<CoworkerModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CoworkerModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField DISPLAYNAME = QueryField(fieldName: "displayName");
  static final QueryField PHOTOURL = QueryField(fieldName: "photoUrl");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField CONTENTS = QueryField(
    fieldName: "contents",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ContentCoworker'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Coworker";
    modelSchemaDefinition.pluralName = "Coworkers";
    
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
      key: Coworker.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coworker.DISPLAYNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coworker.PHOTOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Coworker.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Coworker.CONTENTS,
      isRequired: false,
      ofModelName: 'ContentCoworker',
      associatedKey: ContentCoworker.COWORKER
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

class _CoworkerModelType extends ModelType<Coworker> {
  const _CoworkerModelType();
  
  @override
  Coworker fromJson(Map<String, dynamic> jsonData) {
    return Coworker.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Coworker';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Coworker] in your schema.
 */
@immutable
class CoworkerModelIdentifier implements ModelIdentifier<Coworker> {
  final String id;

  /** Create an instance of CoworkerModelIdentifier using [id] the primary key. */
  const CoworkerModelIdentifier({
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
  String toString() => 'CoworkerModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CoworkerModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
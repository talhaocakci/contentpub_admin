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

import 'package:flutter/material.dart';

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';

/** This is an auto generated class representing the ContentCoworker type in your schema. */
@immutable
class ContentCoworker extends Model {
  static const classType = const _ContentCoworkerModelType();
  final String id;
  final Coworker? _coworker;
  final Content? _content;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ContentCoworkerModelIdentifier get modelIdentifier {
    return ContentCoworkerModelIdentifier(id: id);
  }

  Coworker get coworker {
    try {
      return _coworker!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  Content get content {
    try {
      return _content!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const ContentCoworker._internal(
      {required this.id,
      required coworker,
      required content,
      createdAt,
      updatedAt})
      : _coworker = coworker,
        _content = content,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory ContentCoworker(
      {String? id, required Coworker coworker, required Content content}) {
    return ContentCoworker._internal(
        id: id == null ? UUID.getUUID() : id,
        coworker: coworker,
        content: content);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentCoworker &&
        id == other.id &&
        _coworker == other._coworker &&
        _content == other._content;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ContentCoworker {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("coworker=" +
        (_coworker != null ? _coworker!.toString() : "null") +
        ", ");
    buffer.write(
        "content=" + (_content != null ? _content!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  ContentCoworker copyWith({Coworker? coworker, Content? content}) {
    return ContentCoworker._internal(
        id: id,
        coworker: coworker ?? this.coworker,
        content: content ?? this.content);
  }

  ContentCoworker.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _coworker = json['coworker']?['serializedData'] != null
            ? Coworker.fromJson(new Map<String, dynamic>.from(
                json['coworker']['serializedData']))
            : null,
        _content = json['content']?['serializedData'] != null
            ? Content.fromJson(new Map<String, dynamic>.from(
                json['content']['serializedData']))
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'coworker': _coworker?.toJson(),
        'content': _content?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'coworker': _coworker,
        'content': _content,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final QueryModelIdentifier<ContentCoworkerModelIdentifier>
      MODEL_IDENTIFIER = QueryModelIdentifier<ContentCoworkerModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField COWORKER = QueryField(
      fieldName: "coworker",
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Coworker'));
  static final QueryField CONTENT = QueryField(
      fieldName: "content",
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Content'));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ContentCoworker";
    modelSchemaDefinition.pluralName = "ContentCoworkers";

    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["coworkerId"], name: "byCoworker"),
      ModelIndex(fields: const ["contentId"], name: "byContent")
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: ContentCoworker.COWORKER,
        isRequired: true,
        targetNames: ['coworkerId'],
        ofModelName: 'Coworker'));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: ContentCoworker.CONTENT,
        isRequired: true,
        targetNames: ['contentId'],
        ofModelName: 'Content'));

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

class _ContentCoworkerModelType extends ModelType<ContentCoworker> {
  const _ContentCoworkerModelType();

  @override
  ContentCoworker fromJson(Map<String, dynamic> jsonData) {
    return ContentCoworker.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'ContentCoworker';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ContentCoworker] in your schema.
 */
@immutable
class ContentCoworkerModelIdentifier
    implements ModelIdentifier<ContentCoworker> {
  final String id;

  /** Create an instance of ContentCoworkerModelIdentifier using [id] the primary key. */
  const ContentCoworkerModelIdentifier({required this.id});

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
  String toString() => 'ContentCoworkerModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ContentCoworkerModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

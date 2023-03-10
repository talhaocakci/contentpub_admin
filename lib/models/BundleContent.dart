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


/** This is an auto generated class representing the BundleContent type in your schema. */
@immutable
class BundleContent extends Model {
  static const classType = const _BundleContentModelType();
  final String id;
  final Content? _content;
  final Bundle? _bundle;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  BundleContentModelIdentifier get modelIdentifier {
      return BundleContentModelIdentifier(
        id: id
      );
  }
  
  Content get content {
    try {
      return _content!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Bundle get bundle {
    try {
      return _bundle!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const BundleContent._internal({required this.id, required content, required bundle, createdAt, updatedAt}): _content = content, _bundle = bundle, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory BundleContent({String? id, required Content content, required Bundle bundle}) {
    return BundleContent._internal(
      id: id == null ? UUID.getUUID() : id,
      content: content,
      bundle: bundle);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BundleContent &&
      id == other.id &&
      _content == other._content &&
      _bundle == other._bundle;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("BundleContent {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("content=" + (_content != null ? _content!.toString() : "null") + ", ");
    buffer.write("bundle=" + (_bundle != null ? _bundle!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  BundleContent copyWith({Content? content, Bundle? bundle}) {
    return BundleContent._internal(
      id: id,
      content: content ?? this.content,
      bundle: bundle ?? this.bundle);
  }
  
  BundleContent.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _content = json['content']?['serializedData'] != null
        ? Content.fromJson(new Map<String, dynamic>.from(json['content']['serializedData']))
        : null,
      _bundle = json['bundle']?['serializedData'] != null
        ? Bundle.fromJson(new Map<String, dynamic>.from(json['bundle']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'content': _content?.toJson(), 'bundle': _bundle?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'content': _content, 'bundle': _bundle, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<BundleContentModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<BundleContentModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CONTENT = QueryField(
    fieldName: "content",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Content'));
  static final QueryField BUNDLE = QueryField(
    fieldName: "bundle",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Bundle'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BundleContent";
    modelSchemaDefinition.pluralName = "BundleContents";
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["contentId"], name: "byContent"),
      ModelIndex(fields: const ["bundleId"], name: "byBundle")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: BundleContent.CONTENT,
      isRequired: true,
      targetNames: ['contentId'],
      ofModelName: 'Content'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: BundleContent.BUNDLE,
      isRequired: true,
      targetNames: ['bundleId'],
      ofModelName: 'Bundle'
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

class _BundleContentModelType extends ModelType<BundleContent> {
  const _BundleContentModelType();
  
  @override
  BundleContent fromJson(Map<String, dynamic> jsonData) {
    return BundleContent.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'BundleContent';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [BundleContent] in your schema.
 */
@immutable
class BundleContentModelIdentifier implements ModelIdentifier<BundleContent> {
  final String id;

  /** Create an instance of BundleContentModelIdentifier using [id] the primary key. */
  const BundleContentModelIdentifier({
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
  String toString() => 'BundleContentModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is BundleContentModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
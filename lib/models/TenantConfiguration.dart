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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the TenantConfiguration type in your schema. */
@immutable
class TenantConfiguration extends Model {
  static const classType = const _TenantConfigurationModelType();
  final String id;
  final String? _stripeSecretKey;
  final String? _stripeWebhookSecretKey;
  final String? _stripeWebhookUrl;
  final String? _contentpubApiKey;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TenantConfigurationModelIdentifier get modelIdentifier {
      return TenantConfigurationModelIdentifier(
        id: id
      );
  }
  
  String? get stripeSecretKey {
    return _stripeSecretKey;
  }
  
  String? get stripeWebhookSecretKey {
    return _stripeWebhookSecretKey;
  }
  
  String? get stripeWebhookUrl {
    return _stripeWebhookUrl;
  }
  
  String? get contentpubApiKey {
    return _contentpubApiKey;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TenantConfiguration._internal({required this.id, stripeSecretKey, stripeWebhookSecretKey, stripeWebhookUrl, contentpubApiKey, createdAt, updatedAt}): _stripeSecretKey = stripeSecretKey, _stripeWebhookSecretKey = stripeWebhookSecretKey, _stripeWebhookUrl = stripeWebhookUrl, _contentpubApiKey = contentpubApiKey, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TenantConfiguration({String? id, String? stripeSecretKey, String? stripeWebhookSecretKey, String? stripeWebhookUrl, String? contentpubApiKey}) {
    return TenantConfiguration._internal(
      id: id == null ? UUID.getUUID() : id,
      stripeSecretKey: stripeSecretKey,
      stripeWebhookSecretKey: stripeWebhookSecretKey,
      stripeWebhookUrl: stripeWebhookUrl,
      contentpubApiKey: contentpubApiKey);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TenantConfiguration &&
      id == other.id &&
      _stripeSecretKey == other._stripeSecretKey &&
      _stripeWebhookSecretKey == other._stripeWebhookSecretKey &&
      _stripeWebhookUrl == other._stripeWebhookUrl &&
      _contentpubApiKey == other._contentpubApiKey;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TenantConfiguration {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("stripeSecretKey=" + "$_stripeSecretKey" + ", ");
    buffer.write("stripeWebhookSecretKey=" + "$_stripeWebhookSecretKey" + ", ");
    buffer.write("stripeWebhookUrl=" + "$_stripeWebhookUrl" + ", ");
    buffer.write("contentpubApiKey=" + "$_contentpubApiKey" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TenantConfiguration copyWith({String? stripeSecretKey, String? stripeWebhookSecretKey, String? stripeWebhookUrl, String? contentpubApiKey}) {
    return TenantConfiguration._internal(
      id: id,
      stripeSecretKey: stripeSecretKey ?? this.stripeSecretKey,
      stripeWebhookSecretKey: stripeWebhookSecretKey ?? this.stripeWebhookSecretKey,
      stripeWebhookUrl: stripeWebhookUrl ?? this.stripeWebhookUrl,
      contentpubApiKey: contentpubApiKey ?? this.contentpubApiKey);
  }
  
  TenantConfiguration.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _stripeSecretKey = json['stripeSecretKey'],
      _stripeWebhookSecretKey = json['stripeWebhookSecretKey'],
      _stripeWebhookUrl = json['stripeWebhookUrl'],
      _contentpubApiKey = json['contentpubApiKey'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'stripeSecretKey': _stripeSecretKey, 'stripeWebhookSecretKey': _stripeWebhookSecretKey, 'stripeWebhookUrl': _stripeWebhookUrl, 'contentpubApiKey': _contentpubApiKey, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'stripeSecretKey': _stripeSecretKey, 'stripeWebhookSecretKey': _stripeWebhookSecretKey, 'stripeWebhookUrl': _stripeWebhookUrl, 'contentpubApiKey': _contentpubApiKey, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<TenantConfigurationModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<TenantConfigurationModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STRIPESECRETKEY = QueryField(fieldName: "stripeSecretKey");
  static final QueryField STRIPEWEBHOOKSECRETKEY = QueryField(fieldName: "stripeWebhookSecretKey");
  static final QueryField STRIPEWEBHOOKURL = QueryField(fieldName: "stripeWebhookUrl");
  static final QueryField CONTENTPUBAPIKEY = QueryField(fieldName: "contentpubApiKey");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TenantConfiguration";
    modelSchemaDefinition.pluralName = "TenantConfigurations";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TenantConfiguration.STRIPESECRETKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TenantConfiguration.STRIPEWEBHOOKSECRETKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TenantConfiguration.STRIPEWEBHOOKURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TenantConfiguration.CONTENTPUBAPIKEY,
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
  });
}

class _TenantConfigurationModelType extends ModelType<TenantConfiguration> {
  const _TenantConfigurationModelType();
  
  @override
  TenantConfiguration fromJson(Map<String, dynamic> jsonData) {
    return TenantConfiguration.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TenantConfiguration';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TenantConfiguration] in your schema.
 */
@immutable
class TenantConfigurationModelIdentifier implements ModelIdentifier<TenantConfiguration> {
  final String id;

  /** Create an instance of TenantConfigurationModelIdentifier using [id] the primary key. */
  const TenantConfigurationModelIdentifier({
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
  String toString() => 'TenantConfigurationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TenantConfigurationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
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


/** This is an auto generated class representing the Tenant type in your schema. */
@immutable
class Tenant extends Model {
  static const classType = const _TenantModelType();
  final String id;
  final String? _name;
  final TenantConfiguration? _testingConfiguration;
  final TenantConfiguration? _productionConfiguration;
  final String? _coverPhotoUrl;
  final String? _promoVideoUrl;
  final String? _description;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _tenantTestingConfigurationId;
  final String? _tenantProductionConfigurationId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TenantModelIdentifier get modelIdentifier {
      return TenantModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  TenantConfiguration? get testingConfiguration {
    return _testingConfiguration;
  }
  
  TenantConfiguration? get productionConfiguration {
    return _productionConfiguration;
  }
  
  String? get coverPhotoUrl {
    return _coverPhotoUrl;
  }
  
  String? get promoVideoUrl {
    return _promoVideoUrl;
  }
  
  String? get description {
    return _description;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get tenantTestingConfigurationId {
    return _tenantTestingConfigurationId;
  }
  
  String? get tenantProductionConfigurationId {
    return _tenantProductionConfigurationId;
  }
  
  const Tenant._internal({required this.id, name, testingConfiguration, productionConfiguration, coverPhotoUrl, promoVideoUrl, description, createdAt, updatedAt, tenantTestingConfigurationId, tenantProductionConfigurationId}): _name = name, _testingConfiguration = testingConfiguration, _productionConfiguration = productionConfiguration, _coverPhotoUrl = coverPhotoUrl, _promoVideoUrl = promoVideoUrl, _description = description, _createdAt = createdAt, _updatedAt = updatedAt, _tenantTestingConfigurationId = tenantTestingConfigurationId, _tenantProductionConfigurationId = tenantProductionConfigurationId;
  
  factory Tenant({String? id, String? name, TenantConfiguration? testingConfiguration, TenantConfiguration? productionConfiguration, String? coverPhotoUrl, String? promoVideoUrl, String? description, String? tenantTestingConfigurationId, String? tenantProductionConfigurationId}) {
    return Tenant._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      testingConfiguration: testingConfiguration,
      productionConfiguration: productionConfiguration,
      coverPhotoUrl: coverPhotoUrl,
      promoVideoUrl: promoVideoUrl,
      description: description,
      tenantTestingConfigurationId: tenantTestingConfigurationId,
      tenantProductionConfigurationId: tenantProductionConfigurationId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tenant &&
      id == other.id &&
      _name == other._name &&
      _testingConfiguration == other._testingConfiguration &&
      _productionConfiguration == other._productionConfiguration &&
      _coverPhotoUrl == other._coverPhotoUrl &&
      _promoVideoUrl == other._promoVideoUrl &&
      _description == other._description &&
      _tenantTestingConfigurationId == other._tenantTestingConfigurationId &&
      _tenantProductionConfigurationId == other._tenantProductionConfigurationId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Tenant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("coverPhotoUrl=" + "$_coverPhotoUrl" + ", ");
    buffer.write("promoVideoUrl=" + "$_promoVideoUrl" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("tenantTestingConfigurationId=" + "$_tenantTestingConfigurationId" + ", ");
    buffer.write("tenantProductionConfigurationId=" + "$_tenantProductionConfigurationId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Tenant copyWith({String? name, TenantConfiguration? testingConfiguration, TenantConfiguration? productionConfiguration, String? coverPhotoUrl, String? promoVideoUrl, String? description, String? tenantTestingConfigurationId, String? tenantProductionConfigurationId}) {
    return Tenant._internal(
      id: id,
      name: name ?? this.name,
      testingConfiguration: testingConfiguration ?? this.testingConfiguration,
      productionConfiguration: productionConfiguration ?? this.productionConfiguration,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      promoVideoUrl: promoVideoUrl ?? this.promoVideoUrl,
      description: description ?? this.description,
      tenantTestingConfigurationId: tenantTestingConfigurationId ?? this.tenantTestingConfigurationId,
      tenantProductionConfigurationId: tenantProductionConfigurationId ?? this.tenantProductionConfigurationId);
  }
  
  Tenant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _testingConfiguration = json['testingConfiguration']?['serializedData'] != null
        ? TenantConfiguration.fromJson(new Map<String, dynamic>.from(json['testingConfiguration']['serializedData']))
        : null,
      _productionConfiguration = json['productionConfiguration']?['serializedData'] != null
        ? TenantConfiguration.fromJson(new Map<String, dynamic>.from(json['productionConfiguration']['serializedData']))
        : null,
      _coverPhotoUrl = json['coverPhotoUrl'],
      _promoVideoUrl = json['promoVideoUrl'],
      _description = json['description'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _tenantTestingConfigurationId = json['tenantTestingConfigurationId'],
      _tenantProductionConfigurationId = json['tenantProductionConfigurationId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'testingConfiguration': _testingConfiguration?.toJson(), 'productionConfiguration': _productionConfiguration?.toJson(), 'coverPhotoUrl': _coverPhotoUrl, 'promoVideoUrl': _promoVideoUrl, 'description': _description, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'tenantTestingConfigurationId': _tenantTestingConfigurationId, 'tenantProductionConfigurationId': _tenantProductionConfigurationId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'testingConfiguration': _testingConfiguration, 'productionConfiguration': _productionConfiguration, 'coverPhotoUrl': _coverPhotoUrl, 'promoVideoUrl': _promoVideoUrl, 'description': _description, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'tenantTestingConfigurationId': _tenantTestingConfigurationId, 'tenantProductionConfigurationId': _tenantProductionConfigurationId
  };

  static final QueryModelIdentifier<TenantModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<TenantModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField TESTINGCONFIGURATION = QueryField(
    fieldName: "testingConfiguration",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'TenantConfiguration'));
  static final QueryField PRODUCTIONCONFIGURATION = QueryField(
    fieldName: "productionConfiguration",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'TenantConfiguration'));
  static final QueryField COVERPHOTOURL = QueryField(fieldName: "coverPhotoUrl");
  static final QueryField PROMOVIDEOURL = QueryField(fieldName: "promoVideoUrl");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField TENANTTESTINGCONFIGURATIONID = QueryField(fieldName: "tenantTestingConfigurationId");
  static final QueryField TENANTPRODUCTIONCONFIGURATIONID = QueryField(fieldName: "tenantProductionConfigurationId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Tenant";
    modelSchemaDefinition.pluralName = "Tenants";
    
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
      key: Tenant.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Tenant.TESTINGCONFIGURATION,
      isRequired: false,
      ofModelName: 'TenantConfiguration',
      associatedKey: TenantConfiguration.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Tenant.PRODUCTIONCONFIGURATION,
      isRequired: false,
      ofModelName: 'TenantConfiguration',
      associatedKey: TenantConfiguration.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tenant.COVERPHOTOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tenant.PROMOVIDEOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tenant.DESCRIPTION,
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
      key: Tenant.TENANTTESTINGCONFIGURATIONID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tenant.TENANTPRODUCTIONCONFIGURATIONID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _TenantModelType extends ModelType<Tenant> {
  const _TenantModelType();
  
  @override
  Tenant fromJson(Map<String, dynamic> jsonData) {
    return Tenant.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Tenant';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Tenant] in your schema.
 */
@immutable
class TenantModelIdentifier implements ModelIdentifier<Tenant> {
  final String id;

  /** Create an instance of TenantModelIdentifier using [id] the primary key. */
  const TenantModelIdentifier({
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
  String toString() => 'TenantModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TenantModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
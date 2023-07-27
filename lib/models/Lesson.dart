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


/** This is an auto generated class representing the Lesson type in your schema. */
@immutable
class Lesson extends Model {
  static const classType = const _LessonModelType();
  final String id;
  final String? _name;
  final String? _description;
  final String? _video;
  final int? _videoDuration;
  final String? _sectionID;
  final int? _order;
  final String? _videoFileSize;
  final LessonType? _type;
  final String? _customLessonType;
  final String? _customContent;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LessonModelIdentifier get modelIdentifier {
      return LessonModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  String? get description {
    return _description;
  }
  
  String? get video {
    return _video;
  }
  
  int? get videoDuration {
    return _videoDuration;
  }
  
  String get sectionID {
    try {
      return _sectionID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get order {
    return _order;
  }
  
  String? get videoFileSize {
    return _videoFileSize;
  }
  
  LessonType? get type {
    return _type;
  }
  
  String? get customLessonType {
    return _customLessonType;
  }
  
  String? get customContent {
    return _customContent;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Lesson._internal({required this.id, name, description, video, videoDuration, required sectionID, order, videoFileSize, type, customLessonType, customContent, createdAt, updatedAt}): _name = name, _description = description, _video = video, _videoDuration = videoDuration, _sectionID = sectionID, _order = order, _videoFileSize = videoFileSize, _type = type, _customLessonType = customLessonType, _customContent = customContent, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Lesson({String? id, String? name, String? description, String? video, int? videoDuration, required String sectionID, int? order, String? videoFileSize, LessonType? type, String? customLessonType, String? customContent}) {
    return Lesson._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      description: description,
      video: video,
      videoDuration: videoDuration,
      sectionID: sectionID,
      order: order,
      videoFileSize: videoFileSize,
      type: type,
      customLessonType: customLessonType,
      customContent: customContent);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Lesson &&
      id == other.id &&
      _name == other._name &&
      _description == other._description &&
      _video == other._video &&
      _videoDuration == other._videoDuration &&
      _sectionID == other._sectionID &&
      _order == other._order &&
      _videoFileSize == other._videoFileSize &&
      _type == other._type &&
      _customLessonType == other._customLessonType &&
      _customContent == other._customContent;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Lesson {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("video=" + "$_video" + ", ");
    buffer.write("videoDuration=" + (_videoDuration != null ? _videoDuration!.toString() : "null") + ", ");
    buffer.write("sectionID=" + "$_sectionID" + ", ");
    buffer.write("order=" + (_order != null ? _order!.toString() : "null") + ", ");
    buffer.write("videoFileSize=" + "$_videoFileSize" + ", ");
    buffer.write("type=" + (_type != null ? enumToString(_type)! : "null") + ", ");
    buffer.write("customLessonType=" + "$_customLessonType" + ", ");
    buffer.write("customContent=" + "$_customContent" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Lesson copyWith({String? name, String? description, String? video, int? videoDuration, String? sectionID, int? order, String? videoFileSize, LessonType? type, String? customLessonType, String? customContent}) {
    return Lesson._internal(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      video: video ?? this.video,
      videoDuration: videoDuration ?? this.videoDuration,
      sectionID: sectionID ?? this.sectionID,
      order: order ?? this.order,
      videoFileSize: videoFileSize ?? this.videoFileSize,
      type: type ?? this.type,
      customLessonType: customLessonType ?? this.customLessonType,
      customContent: customContent ?? this.customContent);
  }
  
  Lesson.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _description = json['description'],
      _video = json['video'],
      _videoDuration = (json['videoDuration'] as num?)?.toInt(),
      _sectionID = json['sectionID'],
      _order = (json['order'] as num?)?.toInt(),
      _videoFileSize = json['videoFileSize'],
      _type = enumFromString<LessonType>(json['type'], LessonType.values),
      _customLessonType = json['customLessonType'],
      _customContent = json['customContent'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'description': _description, 'video': _video, 'videoDuration': _videoDuration, 'sectionID': _sectionID, 'order': _order, 'videoFileSize': _videoFileSize, 'type': enumToString(_type), 'customLessonType': _customLessonType, 'customContent': _customContent, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'description': _description, 'video': _video, 'videoDuration': _videoDuration, 'sectionID': _sectionID, 'order': _order, 'videoFileSize': _videoFileSize, 'type': _type, 'customLessonType': _customLessonType, 'customContent': _customContent, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<LessonModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<LessonModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField VIDEO = QueryField(fieldName: "video");
  static final QueryField VIDEODURATION = QueryField(fieldName: "videoDuration");
  static final QueryField SECTIONID = QueryField(fieldName: "sectionID");
  static final QueryField ORDER = QueryField(fieldName: "order");
  static final QueryField VIDEOFILESIZE = QueryField(fieldName: "videoFileSize");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField CUSTOMLESSONTYPE = QueryField(fieldName: "customLessonType");
  static final QueryField CUSTOMCONTENT = QueryField(fieldName: "customContent");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Lesson";
    modelSchemaDefinition.pluralName = "Lessons";
    
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
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["sectionID"], name: "bySection")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.VIDEO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.VIDEODURATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.SECTIONID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.ORDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.VIDEOFILESIZE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.CUSTOMLESSONTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Lesson.CUSTOMCONTENT,
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

class _LessonModelType extends ModelType<Lesson> {
  const _LessonModelType();
  
  @override
  Lesson fromJson(Map<String, dynamic> jsonData) {
    return Lesson.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Lesson';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Lesson] in your schema.
 */
@immutable
class LessonModelIdentifier implements ModelIdentifier<Lesson> {
  final String id;

  /** Create an instance of LessonModelIdentifier using [id] the primary key. */
  const LessonModelIdentifier({
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
  String toString() => 'LessonModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LessonModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
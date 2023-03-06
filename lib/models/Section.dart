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


/** This is an auto generated class representing the Section type in your schema. */
@immutable
class Section extends Model {
  static const classType = const _SectionModelType();
  final String id;
  final String? _name;
  final String? _description;
  final String? _courseID;
  final List<Lesson>? _Lessons;
  final String? _subtitle;
  final int? _order;
  final int? _totalVideoCount;
  final int? _totalVideoDuration;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SectionModelIdentifier get modelIdentifier {
      return SectionModelIdentifier(
        id: id
      );
  }
  
  String? get name {
    return _name;
  }
  
  String? get description {
    return _description;
  }
  
  String get courseID {
    try {
      return _courseID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Lesson>? get Lessons {
    return _Lessons;
  }
  
  String? get subtitle {
    return _subtitle;
  }
  
  int? get order {
    return _order;
  }
  
  int? get totalVideoCount {
    return _totalVideoCount;
  }
  
  int? get totalVideoDuration {
    return _totalVideoDuration;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Section._internal({required this.id, name, description, required courseID, Lessons, subtitle, order, totalVideoCount, totalVideoDuration, createdAt, updatedAt}): _name = name, _description = description, _courseID = courseID, _Lessons = Lessons, _subtitle = subtitle, _order = order, _totalVideoCount = totalVideoCount, _totalVideoDuration = totalVideoDuration, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Section({String? id, String? name, String? description, required String courseID, List<Lesson>? Lessons, String? subtitle, int? order, int? totalVideoCount, int? totalVideoDuration}) {
    return Section._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      description: description,
      courseID: courseID,
      Lessons: Lessons != null ? List<Lesson>.unmodifiable(Lessons) : Lessons,
      subtitle: subtitle,
      order: order,
      totalVideoCount: totalVideoCount,
      totalVideoDuration: totalVideoDuration);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Section &&
      id == other.id &&
      _name == other._name &&
      _description == other._description &&
      _courseID == other._courseID &&
      DeepCollectionEquality().equals(_Lessons, other._Lessons) &&
      _subtitle == other._subtitle &&
      _order == other._order &&
      _totalVideoCount == other._totalVideoCount &&
      _totalVideoDuration == other._totalVideoDuration;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Section {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("courseID=" + "$_courseID" + ", ");
    buffer.write("subtitle=" + "$_subtitle" + ", ");
    buffer.write("order=" + (_order != null ? _order!.toString() : "null") + ", ");
    buffer.write("totalVideoCount=" + (_totalVideoCount != null ? _totalVideoCount!.toString() : "null") + ", ");
    buffer.write("totalVideoDuration=" + (_totalVideoDuration != null ? _totalVideoDuration!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Section copyWith({String? name, String? description, String? courseID, List<Lesson>? Lessons, String? subtitle, int? order, int? totalVideoCount, int? totalVideoDuration}) {
    return Section._internal(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      courseID: courseID ?? this.courseID,
      Lessons: Lessons ?? this.Lessons,
      subtitle: subtitle ?? this.subtitle,
      order: order ?? this.order,
      totalVideoCount: totalVideoCount ?? this.totalVideoCount,
      totalVideoDuration: totalVideoDuration ?? this.totalVideoDuration);
  }
  
  Section.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _description = json['description'],
      _courseID = json['courseID'],
      _Lessons = json['Lessons'] is List
        ? (json['Lessons'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Lesson.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _subtitle = json['subtitle'],
      _order = (json['order'] as num?)?.toInt(),
      _totalVideoCount = (json['totalVideoCount'] as num?)?.toInt(),
      _totalVideoDuration = (json['totalVideoDuration'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'description': _description, 'courseID': _courseID, 'Lessons': _Lessons?.map((Lesson? e) => e?.toJson()).toList(), 'subtitle': _subtitle, 'order': _order, 'totalVideoCount': _totalVideoCount, 'totalVideoDuration': _totalVideoDuration, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'description': _description, 'courseID': _courseID, 'Lessons': _Lessons, 'subtitle': _subtitle, 'order': _order, 'totalVideoCount': _totalVideoCount, 'totalVideoDuration': _totalVideoDuration, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<SectionModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<SectionModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField COURSEID = QueryField(fieldName: "courseID");
  static final QueryField LESSONS = QueryField(
    fieldName: "Lessons",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Lesson'));
  static final QueryField SUBTITLE = QueryField(fieldName: "subtitle");
  static final QueryField ORDER = QueryField(fieldName: "order");
  static final QueryField TOTALVIDEOCOUNT = QueryField(fieldName: "totalVideoCount");
  static final QueryField TOTALVIDEODURATION = QueryField(fieldName: "totalVideoDuration");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Section";
    modelSchemaDefinition.pluralName = "Sections";
    
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
      ModelIndex(fields: const ["courseID"], name: "byCourse")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.COURSEID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Section.LESSONS,
      isRequired: false,
      ofModelName: 'Lesson',
      associatedKey: Lesson.SECTIONID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.SUBTITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.ORDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.TOTALVIDEOCOUNT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Section.TOTALVIDEODURATION,
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

class _SectionModelType extends ModelType<Section> {
  const _SectionModelType();
  
  @override
  Section fromJson(Map<String, dynamic> jsonData) {
    return Section.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Section';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Section] in your schema.
 */
@immutable
class SectionModelIdentifier implements ModelIdentifier<Section> {
  final String id;

  /** Create an instance of SectionModelIdentifier using [id] the primary key. */
  const SectionModelIdentifier({
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
  String toString() => 'SectionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SectionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
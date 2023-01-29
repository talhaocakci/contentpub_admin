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


/** This is an auto generated class representing the Course type in your schema. */
@immutable
class Course extends Model {
  static const classType = const _CourseModelType();
  final String id;
  final String? _title;
  final String? _description;
  final String? _thumbnail;
  final String? _stripeProduct;
  final List<Section>? _Sections;
  final Content? _content;
  final String? _coverPhotoUrl;
  final String? _promoVideoUrl;
  final String? _subtitle;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _courseContentId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CourseModelIdentifier get modelIdentifier {
      return CourseModelIdentifier(
        id: id
      );
  }
  
  String? get title {
    return _title;
  }
  
  String? get description {
    return _description;
  }
  
  String? get thumbnail {
    return _thumbnail;
  }
  
  String? get stripeProduct {
    return _stripeProduct;
  }
  
  List<Section>? get Sections {
    return _Sections;
  }
  
  Content? get content {
    return _content;
  }
  
  String? get coverPhotoUrl {
    return _coverPhotoUrl;
  }
  
  String? get promoVideoUrl {
    return _promoVideoUrl;
  }
  
  String? get subtitle {
    return _subtitle;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get courseContentId {
    return _courseContentId;
  }
  
  const Course._internal({required this.id, title, description, thumbnail, stripeProduct, Sections, content, coverPhotoUrl, promoVideoUrl, subtitle, createdAt, updatedAt, courseContentId}): _title = title, _description = description, _thumbnail = thumbnail, _stripeProduct = stripeProduct, _Sections = Sections, _content = content, _coverPhotoUrl = coverPhotoUrl, _promoVideoUrl = promoVideoUrl, _subtitle = subtitle, _createdAt = createdAt, _updatedAt = updatedAt, _courseContentId = courseContentId;
  
  factory Course({String? id, String? title, String? description, String? thumbnail, String? stripeProduct, List<Section>? Sections, Content? content, String? coverPhotoUrl, String? promoVideoUrl, String? subtitle, String? courseContentId}) {
    return Course._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      description: description,
      thumbnail: thumbnail,
      stripeProduct: stripeProduct,
      Sections: Sections != null ? List<Section>.unmodifiable(Sections) : Sections,
      content: content,
      coverPhotoUrl: coverPhotoUrl,
      promoVideoUrl: promoVideoUrl,
      subtitle: subtitle,
      courseContentId: courseContentId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Course &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _thumbnail == other._thumbnail &&
      _stripeProduct == other._stripeProduct &&
      DeepCollectionEquality().equals(_Sections, other._Sections) &&
      _content == other._content &&
      _coverPhotoUrl == other._coverPhotoUrl &&
      _promoVideoUrl == other._promoVideoUrl &&
      _subtitle == other._subtitle &&
      _courseContentId == other._courseContentId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Course {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("thumbnail=" + "$_thumbnail" + ", ");
    buffer.write("stripeProduct=" + "$_stripeProduct" + ", ");
    buffer.write("coverPhotoUrl=" + "$_coverPhotoUrl" + ", ");
    buffer.write("promoVideoUrl=" + "$_promoVideoUrl" + ", ");
    buffer.write("subtitle=" + "$_subtitle" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("courseContentId=" + "$_courseContentId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Course copyWith({String? title, String? description, String? thumbnail, String? stripeProduct, List<Section>? Sections, Content? content, String? coverPhotoUrl, String? promoVideoUrl, String? subtitle, String? courseContentId}) {
    return Course._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      stripeProduct: stripeProduct ?? this.stripeProduct,
      Sections: Sections ?? this.Sections,
      content: content ?? this.content,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      promoVideoUrl: promoVideoUrl ?? this.promoVideoUrl,
      subtitle: subtitle ?? this.subtitle,
      courseContentId: courseContentId ?? this.courseContentId);
  }
  
  Course.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _thumbnail = json['thumbnail'],
      _stripeProduct = json['stripeProduct'],
      _Sections = json['Sections'] is List
        ? (json['Sections'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Section.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _content = json['content']?['serializedData'] != null
        ? Content.fromJson(new Map<String, dynamic>.from(json['content']['serializedData']))
        : null,
      _coverPhotoUrl = json['coverPhotoUrl'],
      _promoVideoUrl = json['promoVideoUrl'],
      _subtitle = json['subtitle'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _courseContentId = json['courseContentId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'thumbnail': _thumbnail, 'stripeProduct': _stripeProduct, 'Sections': _Sections?.map((Section? e) => e?.toJson()).toList(), 'content': _content?.toJson(), 'coverPhotoUrl': _coverPhotoUrl, 'promoVideoUrl': _promoVideoUrl, 'subtitle': _subtitle, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'courseContentId': _courseContentId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'title': _title, 'description': _description, 'thumbnail': _thumbnail, 'stripeProduct': _stripeProduct, 'Sections': _Sections, 'content': _content, 'coverPhotoUrl': _coverPhotoUrl, 'promoVideoUrl': _promoVideoUrl, 'subtitle': _subtitle, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'courseContentId': _courseContentId
  };

  static final QueryModelIdentifier<CourseModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CourseModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField THUMBNAIL = QueryField(fieldName: "thumbnail");
  static final QueryField STRIPEPRODUCT = QueryField(fieldName: "stripeProduct");
  static final QueryField SECTIONS = QueryField(
    fieldName: "Sections",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Section'));
  static final QueryField CONTENT = QueryField(
    fieldName: "content",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Content'));
  static final QueryField COVERPHOTOURL = QueryField(fieldName: "coverPhotoUrl");
  static final QueryField PROMOVIDEOURL = QueryField(fieldName: "promoVideoUrl");
  static final QueryField SUBTITLE = QueryField(fieldName: "subtitle");
  static final QueryField COURSECONTENTID = QueryField(fieldName: "courseContentId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Course";
    modelSchemaDefinition.pluralName = "Courses";
    
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
      key: Course.TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Course.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Course.THUMBNAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Course.STRIPEPRODUCT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Course.SECTIONS,
      isRequired: false,
      ofModelName: 'Section',
      associatedKey: Section.COURSEID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Course.CONTENT,
      isRequired: false,
      ofModelName: 'Content',
      associatedKey: Content.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Course.COVERPHOTOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Course.PROMOVIDEOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Course.SUBTITLE,
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
      key: Course.COURSECONTENTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _CourseModelType extends ModelType<Course> {
  const _CourseModelType();
  
  @override
  Course fromJson(Map<String, dynamic> jsonData) {
    return Course.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Course';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Course] in your schema.
 */
@immutable
class CourseModelIdentifier implements ModelIdentifier<Course> {
  final String id;

  /** Create an instance of CourseModelIdentifier using [id] the primary key. */
  const CourseModelIdentifier({
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
  String toString() => 'CourseModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CourseModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
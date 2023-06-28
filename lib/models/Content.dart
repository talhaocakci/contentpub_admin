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
  final int? _duration;
  final List<BundleContent>? _bundles;
  final String? _photoUrl;
  final String? _promoVideoUrl;
  final int? _promoVideoDuration;
  final bool? _isPublished;
  final bool? _isArchived;
  final List<ContentCoworker>? _Coworkers;
  final String? _videoDuration;
  final String? _fileSize;
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
  
  int? get duration {
    return _duration;
  }
  
  List<BundleContent>? get bundles {
    return _bundles;
  }
  
  String? get photoUrl {
    return _photoUrl;
  }
  
  String? get promoVideoUrl {
    return _promoVideoUrl;
  }
  
  int? get promoVideoDuration {
    return _promoVideoDuration;
  }
  
  bool? get isPublished {
    return _isPublished;
  }
  
  bool? get isArchived {
    return _isArchived;
  }
  
  List<ContentCoworker>? get Coworkers {
    return _Coworkers;
  }
  
  String? get videoDuration {
    return _videoDuration;
  }
  
  String? get fileSize {
    return _fileSize;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Content._internal({required this.id, name, description, s3Url, type, objectId, owner, duration, bundles, photoUrl, promoVideoUrl, promoVideoDuration, isPublished, isArchived, Coworkers, videoDuration, fileSize, createdAt, updatedAt}): _name = name, _description = description, _s3Url = s3Url, _type = type, _objectId = objectId, _owner = owner, _duration = duration, _bundles = bundles, _photoUrl = photoUrl, _promoVideoUrl = promoVideoUrl, _promoVideoDuration = promoVideoDuration, _isPublished = isPublished, _isArchived = isArchived, _Coworkers = Coworkers, _videoDuration = videoDuration, _fileSize = fileSize, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Content({String? id, String? name, String? description, String? s3Url, ContentType? type, String? objectId, String? owner, int? duration, List<BundleContent>? bundles, String? photoUrl, String? promoVideoUrl, int? promoVideoDuration, bool? isPublished, bool? isArchived, List<ContentCoworker>? Coworkers, String? videoDuration, String? fileSize}) {
    return Content._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      description: description,
      s3Url: s3Url,
      type: type,
      objectId: objectId,
      owner: owner,
      duration: duration,
      bundles: bundles != null ? List<BundleContent>.unmodifiable(bundles) : bundles,
      photoUrl: photoUrl,
      promoVideoUrl: promoVideoUrl,
      promoVideoDuration: promoVideoDuration,
      isPublished: isPublished,
      isArchived: isArchived,
      Coworkers: Coworkers != null ? List<ContentCoworker>.unmodifiable(Coworkers) : Coworkers,
      videoDuration: videoDuration,
      fileSize: fileSize);
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
      _duration == other._duration &&
      DeepCollectionEquality().equals(_bundles, other._bundles) &&
      _photoUrl == other._photoUrl &&
      _promoVideoUrl == other._promoVideoUrl &&
      _promoVideoDuration == other._promoVideoDuration &&
      _isPublished == other._isPublished &&
      _isArchived == other._isArchived &&
      DeepCollectionEquality().equals(_Coworkers, other._Coworkers) &&
      _videoDuration == other._videoDuration &&
      _fileSize == other._fileSize;
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
    buffer.write("duration=" + (_duration != null ? _duration!.toString() : "null") + ", ");
    buffer.write("photoUrl=" + "$_photoUrl" + ", ");
    buffer.write("promoVideoUrl=" + "$_promoVideoUrl" + ", ");
    buffer.write("promoVideoDuration=" + (_promoVideoDuration != null ? _promoVideoDuration!.toString() : "null") + ", ");
    buffer.write("isPublished=" + (_isPublished != null ? _isPublished!.toString() : "null") + ", ");
    buffer.write("isArchived=" + (_isArchived != null ? _isArchived!.toString() : "null") + ", ");
    buffer.write("videoDuration=" + "$_videoDuration" + ", ");
    buffer.write("fileSize=" + "$_fileSize" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Content copyWith({String? name, String? description, String? s3Url, ContentType? type, String? objectId, String? owner, int? duration, List<BundleContent>? bundles, String? photoUrl, String? promoVideoUrl, int? promoVideoDuration, bool? isPublished, bool? isArchived, List<ContentCoworker>? Coworkers, String? videoDuration, String? fileSize}) {
    return Content._internal(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      s3Url: s3Url ?? this.s3Url,
      type: type ?? this.type,
      objectId: objectId ?? this.objectId,
      owner: owner ?? this.owner,
      duration: duration ?? this.duration,
      bundles: bundles ?? this.bundles,
      photoUrl: photoUrl ?? this.photoUrl,
      promoVideoUrl: promoVideoUrl ?? this.promoVideoUrl,
      promoVideoDuration: promoVideoDuration ?? this.promoVideoDuration,
      isPublished: isPublished ?? this.isPublished,
      isArchived: isArchived ?? this.isArchived,
      Coworkers: Coworkers ?? this.Coworkers,
      videoDuration: videoDuration ?? this.videoDuration,
      fileSize: fileSize ?? this.fileSize);
  }
  
  Content.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _description = json['description'],
      _s3Url = json['s3Url'],
      _type = enumFromString<ContentType>(json['type'], ContentType.values),
      _objectId = json['objectId'],
      _owner = json['owner'],
      _duration = (json['duration'] as num?)?.toInt(),
      _bundles = json['bundles'] is List
        ? (json['bundles'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => BundleContent.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _photoUrl = json['photoUrl'],
      _promoVideoUrl = json['promoVideoUrl'],
      _promoVideoDuration = (json['promoVideoDuration'] as num?)?.toInt(),
      _isPublished = json['isPublished'],
      _isArchived = json['isArchived'],
      _Coworkers = json['Coworkers'] is List
        ? (json['Coworkers'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ContentCoworker.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _videoDuration = json['videoDuration'],
      _fileSize = json['fileSize'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'description': _description, 's3Url': _s3Url, 'type': enumToString(_type), 'objectId': _objectId, 'owner': _owner, 'duration': _duration, 'bundles': _bundles?.map((BundleContent? e) => e?.toJson()).toList(), 'photoUrl': _photoUrl, 'promoVideoUrl': _promoVideoUrl, 'promoVideoDuration': _promoVideoDuration, 'isPublished': _isPublished, 'isArchived': _isArchived, 'Coworkers': _Coworkers?.map((ContentCoworker? e) => e?.toJson()).toList(), 'videoDuration': _videoDuration, 'fileSize': _fileSize, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'description': _description, 's3Url': _s3Url, 'type': _type, 'objectId': _objectId, 'owner': _owner, 'duration': _duration, 'bundles': _bundles, 'photoUrl': _photoUrl, 'promoVideoUrl': _promoVideoUrl, 'promoVideoDuration': _promoVideoDuration, 'isPublished': _isPublished, 'isArchived': _isArchived, 'Coworkers': _Coworkers, 'videoDuration': _videoDuration, 'fileSize': _fileSize, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ContentModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ContentModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField S3URL = QueryField(fieldName: "s3Url");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField OBJECTID = QueryField(fieldName: "objectId");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static final QueryField DURATION = QueryField(fieldName: "duration");
  static final QueryField BUNDLES = QueryField(
    fieldName: "bundles",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'BundleContent'));
  static final QueryField PHOTOURL = QueryField(fieldName: "photoUrl");
  static final QueryField PROMOVIDEOURL = QueryField(fieldName: "promoVideoUrl");
  static final QueryField PROMOVIDEODURATION = QueryField(fieldName: "promoVideoDuration");
  static final QueryField ISPUBLISHED = QueryField(fieldName: "isPublished");
  static final QueryField ISARCHIVED = QueryField(fieldName: "isArchived");
  static final QueryField COWORKERS = QueryField(
    fieldName: "Coworkers",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ContentCoworker'));
  static final QueryField VIDEODURATION = QueryField(fieldName: "videoDuration");
  static final QueryField FILESIZE = QueryField(fieldName: "fileSize");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Content";
    modelSchemaDefinition.pluralName = "Contents";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.DURATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Content.BUNDLES,
      isRequired: false,
      ofModelName: 'BundleContent',
      associatedKey: BundleContent.CONTENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.PHOTOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.PROMOVIDEOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.PROMOVIDEODURATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.ISPUBLISHED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.ISARCHIVED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Content.COWORKERS,
      isRequired: false,
      ofModelName: 'ContentCoworker',
      associatedKey: ContentCoworker.CONTENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.VIDEODURATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Content.FILESIZE,
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

class _ContentModelType extends ModelType<Content> {
  const _ContentModelType();
  
  @override
  Content fromJson(Map<String, dynamic> jsonData) {
    return Content.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Content';
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
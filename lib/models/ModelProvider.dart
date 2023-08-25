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
import 'Bundle.dart';
import 'BundleContent.dart';
import 'Content.dart';
import 'ContentCoworker.dart';
import 'Course.dart';
import 'Coworker.dart';
import 'Customer.dart';
import 'Lesson.dart';
import 'Price.dart';
import 'Purchase.dart';
import 'Section.dart';
import 'Tenant.dart';
import 'TenantConfiguration.dart';

export 'Bundle.dart';
export 'BundleContent.dart';
export 'Content.dart';
export 'ContentCoworker.dart';
export 'ContentType.dart';
export 'Course.dart';
export 'Coworker.dart';
export 'Customer.dart';
export 'Lesson.dart';
export 'LessonType.dart';
export 'Price.dart';
export 'Purchase.dart';
export 'PurchaseType.dart';
export 'RecurrenceType.dart';
export 'Section.dart';
export 'Source.dart';
export 'Tenant.dart';
export 'TenantConfiguration.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "95e980a2647f60556e3a0e44cd4fb873";
  @override
  List<ModelSchema> modelSchemas = [Bundle.schema, BundleContent.schema, Content.schema, ContentCoworker.schema, Course.schema, Coworker.schema, Customer.schema, Lesson.schema, Price.schema, Purchase.schema, Section.schema, Tenant.schema, TenantConfiguration.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Bundle":
        return Bundle.classType;
      case "BundleContent":
        return BundleContent.classType;
      case "Content":
        return Content.classType;
      case "ContentCoworker":
        return ContentCoworker.classType;
      case "Course":
        return Course.classType;
      case "Coworker":
        return Coworker.classType;
      case "Customer":
        return Customer.classType;
      case "Lesson":
        return Lesson.classType;
      case "Price":
        return Price.classType;
      case "Purchase":
        return Purchase.classType;
      case "Section":
        return Section.classType;
      case "Tenant":
        return Tenant.classType;
      case "TenantConfiguration":
        return TenantConfiguration.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}
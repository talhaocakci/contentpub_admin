import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/models/Bundle.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Coworker.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/models/Price.dart';
import 'package:contentpub_admin/models/PurchaseType.dart';
import 'package:contentpub_admin/models/RecurrenceType.dart';
import 'package:contentpub_admin/models/Section.dart';
import 'package:flutter/foundation.dart';

class EditableCourse {
  String? id;
  String? title;
  String? description;
  String? thumbnail;
  String? stripeProduct;
  List<EditableSection>? Sections;
  Content? content;
  String? coverPhotoUrl;
  String? promoVideoUrl;
  String? subtitle;
  String? courseContentId;
  bool dirty = false;
  bool newItem = false;

  static Course fromEditable(EditableCourse editable) {
    List<Section>? sections = (editable.Sections != null)
        ? editable.Sections?.map((e) => EditableSection.fromEditable(e))
            .toList()
        : List.empty();

    return Course(
        id: editable.id,
        title: editable.title,
        description: editable.description,
        thumbnail: editable.thumbnail,
        stripeProduct: editable.stripeProduct,
        Sections: sections,
        content: editable.content,
        coverPhotoUrl: editable.coverPhotoUrl,
        promoVideoUrl: editable.promoVideoUrl,
        subtitle: editable.subtitle,
        courseContentId: editable.courseContentId);
  }

  static EditableCourse toEditable(Course course) {
    List<EditableSection>? sections = (course.Sections != null)
        ? course.Sections?.map((e) => EditableSection.toEditable(e)).toList()
        : List.empty();

    sections!.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));

    EditableCourse editableCourse = EditableCourse();
    editableCourse.id = course.id;
    editableCourse.title = course.title;
    editableCourse.description = course.description;
    editableCourse.thumbnail = course.thumbnail;
    editableCourse.stripeProduct = course.stripeProduct;
    editableCourse.Sections = sections;
    editableCourse.content = course.content;
    editableCourse.coverPhotoUrl = course.coverPhotoUrl;
    editableCourse.promoVideoUrl = course.promoVideoUrl;
    editableCourse.subtitle = course.subtitle;
    editableCourse.courseContentId = course.courseContentId;
    editableCourse.newItem = false;
    editableCourse.dirty = false;

    return editableCourse;
  }
}

class EditableSection {
  String? id;
  String? name;
  String? description;
  String? courseID;
  List<EditableLesson>? Lessons;
  String? subtitle;
  int? order;
  bool dirty = false;
  bool newItem = false;

  EditableSection(
      {required this.courseID,
      required this.name,
      this.dirty: true,
      this.newItem: true});

  static Section fromEditable(EditableSection editable) {
    List<Lesson>? editableLessons = (editable.Lessons != null)
        ? editable.Lessons?.map((e) => EditableLesson.fromEditable(e)).toList()
        : List.empty();

    return Section(
        id: editable.id,
        name: editable.name,
        description: editable.description,
        subtitle: editable.subtitle,
        courseID: editable.courseID ?? '',
        order: editable.order,
        Lessons: editableLessons);
  }

  static EditableSection toEditable(Section section) {
    List<EditableLesson>? editableLessons = (section.Lessons != null)
        ? section.Lessons?.map((e) => EditableLesson.toEditable(e)).toList()
        : List.empty();

    editableLessons!.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));

    EditableSection editableSection =
        EditableSection(courseID: section.courseID, name: section.name);

    editableSection.id = section.id;
    editableSection.name = section.name;
    editableSection.description = section.description;
    editableSection.subtitle = section.subtitle;
    editableSection.courseID = section.courseID;
    editableSection.Lessons = editableLessons;
    editableSection.newItem = false;
    editableSection.dirty = false;
    editableSection.order = section.order;

    return editableSection;
  }
}

class EditableLesson {
  String? id;
  String? name;
  String? description;
  String? video;
  String? sectionID;
  int? order;
  bool dirty = false;
  bool newItem = false;

  EditableLesson(
      {required this.sectionID,
      required this.name,
      this.id,
      this.dirty: true,
      this.newItem: true});

  static Lesson fromEditable(EditableLesson editable) {
    return Lesson(
        sectionID: editable.sectionID ?? 'no section id found',
        name: editable.name,
        description: editable.description,
        video: editable.video,
        order: editable.order,
        id: editable.id);
  }

  static EditableLesson toEditable(Lesson lesson) {
    EditableLesson editableLesson =
        EditableLesson(sectionID: lesson.sectionID, name: lesson.name);

    editableLesson.description = lesson.description;
    editableLesson.video = lesson.video;
    editableLesson.id = lesson.id;
    editableLesson.sectionID = lesson.sectionID;
    editableLesson.order = lesson.order;
    editableLesson.newItem = false;
    editableLesson.dirty = false;

    return editableLesson;
  }
}

class EditableBundle {
  String id;
  String? name;
  String? description;
  bool? isFree;
  List<BundleContent>? contents;
  List<EditablePrice>? prices;
  bool? isAllAccess;
  String? stripeProductId;

  EditableBundle({required this.id});

  static EditableBundle toEditable(Bundle bundle) {
    List<EditablePrice>? editablePrices = (bundle.prices != null)
        ? bundle.prices?.map((e) => EditablePrice.toEditable(e)).toList()
        : List.empty();

    EditableBundle editable = EditableBundle(id: bundle.id);
    editable.name = bundle.name;
    editable.description = bundle.description;
    editable.isFree = bundle.isFree;
    editable.contents = bundle.contents ?? List.empty();
    editable.prices = editablePrices;
    editable.isAllAccess = bundle.isAllAccess;
    editable.stripeProductId = bundle.stripeProductId;

    return editable;
  }

  static Bundle fromEditable(EditableBundle editable) {
    List<Price>? prices = (editable.prices != null)
        ? editable.prices?.map((e) => EditablePrice.fromEditable(e)).toList()
        : List.empty();

    Bundle b = Bundle(
        id: editable.id,
        name: editable.name,
        description: editable.description,
        isFree: editable.isFree,
        contents: editable.contents,
        prices: prices,
        isAllAccess: editable.isAllAccess,
        stripeProductId: editable.stripeProductId);

    return b;
  }
}

class EditablePrice {
  String id;
  String? stripePriceId;
  PurchaseType? purchaseType;
  RecurrenceType? recurrenceType;
  int? recurrenceInterval;
  String? currency;
  double? amount;
  String? bundleID;

  EditablePrice(
      {required this.id,
      this.purchaseType,
      this.recurrenceType,
      this.recurrenceInterval});

  static EditablePrice toEditable(Price price) {
    EditablePrice editable = EditablePrice(id: price.id);
    editable.stripePriceId = price.stripePriceId;
    editable.purchaseType = price.purchaseType;
    editable.recurrenceType = price.recurrenceType;
    editable.currency = price.currency;
    editable.amount = price.amount;
    editable.bundleID = price.bundleID;
    editable.recurrenceInterval = price.recurrenceInterval;
    return editable;
  }

  static Price fromEditable(EditablePrice editable) {
    return Price(
        bundleID: editable.bundleID ?? 'unknown bundle id',
        amount: editable.amount,
        currency: editable.currency,
        id: editable.id,
        purchaseType: editable.purchaseType,
        recurrenceType: editable.recurrenceType,
        recurrenceInterval: editable.recurrenceInterval,
        stripePriceId: editable.stripePriceId);
  }
}

class EditableContent {
  String id;
  String? name;
  String? description;
  String? s3Url;
  ContentType type;
  String? objectId;
  String? owner;
  String? photoUrl;
  String? promoVideoUrl;
  List<ContentCoworker>? coworkerRelations;
  bool? isPublished = false;
  bool? isArchived = false;

  bool dirty = false;
  bool? newItem = false;

  EditableContent({required this.id, required this.type, this.newItem});

  static EditableContent toEditable(Content content) {
    EditableContent editable = EditableContent(
        id: content.id, type: content.type ?? ContentType.DOCUMENT);

    editable.name = content.name;
    editable.description = content.description;
    editable.objectId = content.objectId;
    editable.owner = content.owner;
    editable.s3Url = content.s3Url;
    editable.photoUrl = content.photoUrl;
    editable.promoVideoUrl = content.promoVideoUrl;
    editable.isPublished = content.isPublished;
    editable.isArchived = content.isArchived;
    editable.coworkerRelations = content.Coworkers;

    return editable;
  }

  static Content fromEditable(EditableContent editable) {
    Content content = Content(
        id: editable.id,
        type: editable.type,
        name: editable.name,
        description: editable.description,
        objectId: editable.objectId,
        owner: editable.owner,
        s3Url: editable.s3Url,
        photoUrl: editable.photoUrl,
        promoVideoUrl: editable.promoVideoUrl,
        isPublished: editable.isPublished,
        Coworkers: editable.coworkerRelations!,
        isArchived: editable.isArchived);

    return content;
  }
}

class EditableCoworker {
  String id;
  String? email;
  String? displayName;
  String? photoUrl;
  String? description;
  bool dirty = false;
  bool newItem = false;

  EditableCoworker(
      {required this.id,
      this.email,
      this.displayName,
      this.photoUrl,
      this.description});

  static Coworker fromEditable(EditableCoworker editable) {
    return Coworker(
        id: editable.id,
        displayName: editable.displayName,
        description: editable.description,
        photoUrl: editable.photoUrl,
        email: editable.email);
  }

  static EditableCoworker toEditable(Coworker coworker) {
    EditableCoworker editable = EditableCoworker(id: coworker.id);
    editable.email = coworker.email;
    editable.description = coworker.description;
    editable.displayName = coworker.displayName;
    editable.photoUrl = coworker.photoUrl;

    return editable;
  }
}

class EditableTenant {
  String id;
  String? name;
  EditableTenantConfiguration? testingConfiguration;
  EditableTenantConfiguration? productionConfiguration;
  String? coverPhotoUrl;
  String? promoVideoUrl;
  String? description;
  bool newItem = false;

  EditableTenant({required this.id});

  static Tenant fromEditable(EditableTenant editable) {
    var staging = EditableTenantConfiguration.fromEditable(
        editable.testingConfiguration!);
    var prod = EditableTenantConfiguration.fromEditable(
        editable.productionConfiguration!);

    return Tenant(
        id: editable.coverPhotoUrl = editable.coverPhotoUrl,
        promoVideoUrl: editable.promoVideoUrl,
        name: editable.name,
        testingConfiguration: staging,
        productionConfiguration: prod,
        tenantProductionConfigurationId: prod.id,
        tenantTestingConfigurationId: staging.id,
        description: editable.description);
  }

  static EditableTenant toEditable(Tenant tenant) {
    EditableTenant editable = EditableTenant(id: tenant.id);

    editable.promoVideoUrl = tenant.promoVideoUrl;
    editable.name = tenant.name;
    editable.description = tenant.description;
    editable.coverPhotoUrl = tenant.coverPhotoUrl;

    editable.testingConfiguration = tenant.testingConfiguration != null
        ? EditableTenantConfiguration.toEditable(tenant.testingConfiguration!)
        : EditableTenantConfiguration(id: '${tenant.id}-testing');

    editable.productionConfiguration = tenant.testingConfiguration != null
        ? EditableTenantConfiguration.toEditable(tenant.testingConfiguration!)
        : EditableTenantConfiguration(id: '${tenant.id}-prod');

    return editable;
  }
}

class EditableTenantConfiguration {
  String id;
  String? stripeSecretKey;
  String? stripeWebhookSecretKey;
  String? stripeWebhookUrl;
  String? contentpubApiKey;

  EditableTenantConfiguration({required this.id});

  static EditableTenantConfiguration toEditable(TenantConfiguration conf) {
    EditableTenantConfiguration editable =
        EditableTenantConfiguration(id: conf.id);
    editable.contentpubApiKey = conf.contentpubApiKey;
    editable.stripeSecretKey = conf.stripeSecretKey;
    editable.stripeWebhookSecretKey = conf.stripeWebhookSecretKey;
    editable.stripeWebhookUrl = conf.stripeWebhookUrl;
    return editable;
  }

  static TenantConfiguration fromEditable(
      EditableTenantConfiguration editable) {
    return TenantConfiguration(
        id: editable.id,
        contentpubApiKey: editable.contentpubApiKey,
        stripeSecretKey: editable.stripeSecretKey,
        stripeWebhookSecretKey: editable.stripeWebhookSecretKey,
        stripeWebhookUrl: editable.stripeWebhookUrl);
  }
}

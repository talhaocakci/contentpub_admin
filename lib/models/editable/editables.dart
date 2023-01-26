import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/models/Bundle.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Price.dart';
import 'package:contentpub_admin/models/PurchaseType.dart';
import 'package:contentpub_admin/models/RecurrenceType.dart';
import 'package:contentpub_admin/models/Section.dart';

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
  List<Content>? contents;
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
    editable.contents = bundle.contents;
    editable.prices = editablePrices;
    editable.isAllAccess = bundle.isAllAccess;
    editable.stripeProductId = bundle.stripeProductId;

    return editable;
  }

  static Bundle fromEditable(EditableBundle editable) {
    List<Price>? prices = (editable.prices != null)
        ? editable.prices?.map((e) => EditablePrice.fromEditable(e)).toList()
        : List.empty();

    return Bundle(
        id: editable.id,
        name: editable.name,
        description: editable.description,
        isFree: editable.isFree,
        contents: editable.contents,
        prices: prices,
        isAllAccess: editable.isAllAccess,
        stripeProductId: editable.stripeProductId);
  }
}

class EditablePrice {
  String id;
  String? stripePriceId;
  PurchaseType? purchaseType;
  RecurrenceType? recurrenceType;
  String? currency;
  double? amount;
  String? bundleID;

  EditablePrice({required this.id});

  static EditablePrice toEditable(Price price) {
    EditablePrice editable = EditablePrice(id: price.id);
    editable.stripePriceId = price.stripePriceId;
    editable.purchaseType = price.purchaseType;
    editable.recurrenceType = price.recurrenceType;
    editable.currency = price.currency;
    editable.amount = price.amount;
    editable.bundleID = price.bundleID;
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
        stripePriceId: editable.stripePriceId);
  }
}

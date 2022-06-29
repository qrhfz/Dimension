// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_story.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetVisitedStoryCollection on Isar {
  IsarCollection<VisitedStory> get visitedStories => getCollection();
}

const VisitedStorySchema = CollectionSchema(
  name: 'VisitedStory',
  schema:
      '{"name":"VisitedStory","idName":"itemId","properties":[],"indexes":[],"links":[]}',
  idName: 'itemId',
  propertyIds: {},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _visitedStoryGetId,
  setId: _visitedStorySetId,
  getLinks: _visitedStoryGetLinks,
  attachLinks: _visitedStoryAttachLinks,
  serializeNative: _visitedStorySerializeNative,
  deserializeNative: _visitedStoryDeserializeNative,
  deserializePropNative: _visitedStoryDeserializePropNative,
  serializeWeb: _visitedStorySerializeWeb,
  deserializeWeb: _visitedStoryDeserializeWeb,
  deserializePropWeb: _visitedStoryDeserializePropWeb,
  version: 3,
);

int? _visitedStoryGetId(VisitedStory object) {
  if (object.itemId == Isar.autoIncrement) {
    return null;
  } else {
    return object.itemId;
  }
}

void _visitedStorySetId(VisitedStory object, int id) {
  object.itemId = id;
}

List<IsarLinkBase> _visitedStoryGetLinks(VisitedStory object) {
  return [];
}

void _visitedStorySerializeNative(
    IsarCollection<VisitedStory> collection,
    IsarRawObject rawObj,
    VisitedStory object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
}

VisitedStory _visitedStoryDeserializeNative(
    IsarCollection<VisitedStory> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = VisitedStory();
  object.itemId = id;
  return object;
}

P _visitedStoryDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _visitedStorySerializeWeb(
    IsarCollection<VisitedStory> collection, VisitedStory object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'itemId', object.itemId);
  return jsObj;
}

VisitedStory _visitedStoryDeserializeWeb(
    IsarCollection<VisitedStory> collection, dynamic jsObj) {
  final object = VisitedStory();
  object.itemId = IsarNative.jsObjectGet(jsObj, 'itemId');
  return object;
}

P _visitedStoryDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'itemId':
      return (IsarNative.jsObjectGet(jsObj, 'itemId')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _visitedStoryAttachLinks(
    IsarCollection col, int id, VisitedStory object) {}

extension VisitedStoryQueryWhereSort
    on QueryBuilder<VisitedStory, VisitedStory, QWhere> {
  QueryBuilder<VisitedStory, VisitedStory, QAfterWhere> anyItemId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension VisitedStoryQueryWhere
    on QueryBuilder<VisitedStory, VisitedStory, QWhereClause> {
  QueryBuilder<VisitedStory, VisitedStory, QAfterWhereClause> itemIdEqualTo(
      int itemId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: itemId,
      includeLower: true,
      upper: itemId,
      includeUpper: true,
    ));
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterWhereClause> itemIdNotEqualTo(
      int itemId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: itemId, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: itemId, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: itemId, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: itemId, includeUpper: false),
      );
    }
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterWhereClause> itemIdGreaterThan(
      int itemId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: itemId, includeLower: include),
    );
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterWhereClause> itemIdLessThan(
      int itemId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: itemId, includeUpper: include),
    );
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterWhereClause> itemIdBetween(
    int lowerItemId,
    int upperItemId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerItemId,
      includeLower: includeLower,
      upper: upperItemId,
      includeUpper: includeUpper,
    ));
  }
}

extension VisitedStoryQueryFilter
    on QueryBuilder<VisitedStory, VisitedStory, QFilterCondition> {
  QueryBuilder<VisitedStory, VisitedStory, QAfterFilterCondition>
      itemIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemId',
      value: null,
    ));
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterFilterCondition> itemIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemId',
      value: value,
    ));
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterFilterCondition>
      itemIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemId',
      value: value,
    ));
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterFilterCondition>
      itemIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemId',
      value: value,
    ));
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterFilterCondition> itemIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension VisitedStoryQueryLinks
    on QueryBuilder<VisitedStory, VisitedStory, QFilterCondition> {}

extension VisitedStoryQueryWhereSortBy
    on QueryBuilder<VisitedStory, VisitedStory, QSortBy> {
  QueryBuilder<VisitedStory, VisitedStory, QAfterSortBy> sortByItemId() {
    return addSortByInternal('itemId', Sort.asc);
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterSortBy> sortByItemIdDesc() {
    return addSortByInternal('itemId', Sort.desc);
  }
}

extension VisitedStoryQueryWhereSortThenBy
    on QueryBuilder<VisitedStory, VisitedStory, QSortThenBy> {
  QueryBuilder<VisitedStory, VisitedStory, QAfterSortBy> thenByItemId() {
    return addSortByInternal('itemId', Sort.asc);
  }

  QueryBuilder<VisitedStory, VisitedStory, QAfterSortBy> thenByItemIdDesc() {
    return addSortByInternal('itemId', Sort.desc);
  }
}

extension VisitedStoryQueryWhereDistinct
    on QueryBuilder<VisitedStory, VisitedStory, QDistinct> {
  QueryBuilder<VisitedStory, VisitedStory, QDistinct> distinctByItemId() {
    return addDistinctByInternal('itemId');
  }
}

extension VisitedStoryQueryProperty
    on QueryBuilder<VisitedStory, VisitedStory, QQueryProperty> {
  QueryBuilder<VisitedStory, int?, QQueryOperations> itemIdProperty() {
    return addPropertyNameInternal('itemId');
  }
}

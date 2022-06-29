// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_link.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetVisitedLinkCollection on Isar {
  IsarCollection<VisitedLink> get visitedLinks => getCollection();
}

const VisitedLinkSchema = CollectionSchema(
  name: 'VisitedLink',
  schema:
      '{"name":"VisitedLink","idName":"id","properties":[{"name":"url","type":"String"}],"indexes":[{"name":"url","unique":false,"properties":[{"name":"url","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'url': 0},
  listProperties: {},
  indexIds: {'url': 0},
  indexValueTypes: {
    'url': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _visitedLinkGetId,
  setId: _visitedLinkSetId,
  getLinks: _visitedLinkGetLinks,
  attachLinks: _visitedLinkAttachLinks,
  serializeNative: _visitedLinkSerializeNative,
  deserializeNative: _visitedLinkDeserializeNative,
  deserializePropNative: _visitedLinkDeserializePropNative,
  serializeWeb: _visitedLinkSerializeWeb,
  deserializeWeb: _visitedLinkDeserializeWeb,
  deserializePropWeb: _visitedLinkDeserializePropWeb,
  version: 3,
);

int? _visitedLinkGetId(VisitedLink object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _visitedLinkSetId(VisitedLink object, int id) {
  object.id = id;
}

List<IsarLinkBase> _visitedLinkGetLinks(VisitedLink object) {
  return [];
}

void _visitedLinkSerializeNative(
    IsarCollection<VisitedLink> collection,
    IsarRawObject rawObj,
    VisitedLink object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.url;
  final _url = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_url.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _url);
}

VisitedLink _visitedLinkDeserializeNative(
    IsarCollection<VisitedLink> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = VisitedLink();
  object.id = id;
  object.url = reader.readString(offsets[0]);
  return object;
}

P _visitedLinkDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _visitedLinkSerializeWeb(
    IsarCollection<VisitedLink> collection, VisitedLink object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'url', object.url);
  return jsObj;
}

VisitedLink _visitedLinkDeserializeWeb(
    IsarCollection<VisitedLink> collection, dynamic jsObj) {
  final object = VisitedLink();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.url = IsarNative.jsObjectGet(jsObj, 'url') ?? '';
  return object;
}

P _visitedLinkDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'url':
      return (IsarNative.jsObjectGet(jsObj, 'url') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _visitedLinkAttachLinks(IsarCollection col, int id, VisitedLink object) {}

extension VisitedLinkQueryWhereSort
    on QueryBuilder<VisitedLink, VisitedLink, QWhere> {
  QueryBuilder<VisitedLink, VisitedLink, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterWhere> anyUrl() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'url'));
  }
}

extension VisitedLinkQueryWhere
    on QueryBuilder<VisitedLink, VisitedLink, QWhereClause> {
  QueryBuilder<VisitedLink, VisitedLink, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterWhereClause> urlEqualTo(
      String url) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'url',
      value: [url],
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterWhereClause> urlNotEqualTo(
      String url) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'url',
        upper: [url],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'url',
        lower: [url],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'url',
        lower: [url],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'url',
        upper: [url],
        includeUpper: false,
      ));
    }
  }
}

extension VisitedLinkQueryFilter
    on QueryBuilder<VisitedLink, VisitedLink, QFilterCondition> {
  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'url',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'url',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension VisitedLinkQueryLinks
    on QueryBuilder<VisitedLink, VisitedLink, QFilterCondition> {}

extension VisitedLinkQueryWhereSortBy
    on QueryBuilder<VisitedLink, VisitedLink, QSortBy> {
  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> sortByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> sortByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension VisitedLinkQueryWhereSortThenBy
    on QueryBuilder<VisitedLink, VisitedLink, QSortThenBy> {
  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> thenByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<VisitedLink, VisitedLink, QAfterSortBy> thenByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension VisitedLinkQueryWhereDistinct
    on QueryBuilder<VisitedLink, VisitedLink, QDistinct> {
  QueryBuilder<VisitedLink, VisitedLink, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<VisitedLink, VisitedLink, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('url', caseSensitive: caseSensitive);
  }
}

extension VisitedLinkQueryProperty
    on QueryBuilder<VisitedLink, VisitedLink, QQueryProperty> {
  QueryBuilder<VisitedLink, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<VisitedLink, String, QQueryOperations> urlProperty() {
    return addPropertyNameInternal('url');
  }
}

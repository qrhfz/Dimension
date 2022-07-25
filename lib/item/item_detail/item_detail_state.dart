import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/models/item_detail.dart';

part 'item_detail_state.freezed.dart';

@freezed
class ItemDetailState with _$ItemDetailState {
  const factory ItemDetailState.loading() = _Loading;
  const factory ItemDetailState.data(IList<FlatItemDetail> item) = _Item;
  const factory ItemDetailState.error(String message) = _Error;
}

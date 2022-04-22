import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_client/models/item.dart';

part 'item_state.freezed.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.loading() = _Loading;
  const factory ItemState.data(Item item) = _Item;
  const factory ItemState.error(String message) = _Error;
}

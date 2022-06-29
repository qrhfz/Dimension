import 'package:equatable/equatable.dart';
import 'package:hn_client/view/providers/item_state.dart';

class StoryState extends Equatable {
  final ItemState item;
  final bool visited;

  const StoryState(this.item, this.visited);

  @override
  List<Object?> get props => [item, visited];
}

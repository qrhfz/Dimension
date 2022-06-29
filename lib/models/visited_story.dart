import 'package:isar/isar.dart';

part 'visited_story.g.dart';

@Collection(accessor: "visitedStories")
class VisitedStory {
  @Id()
  int? itemId;
}

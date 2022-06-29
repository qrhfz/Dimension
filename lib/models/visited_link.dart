import 'package:isar/isar.dart';

part 'visited_link.g.dart';

@Collection()
class VisitedLink {
  @Id()
  int? id;
  @Index(type: IndexType.hash, unique: true)
  late String url;
}

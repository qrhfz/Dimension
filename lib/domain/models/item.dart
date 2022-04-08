abstract class Item {
  final int id;
  final bool isDeleted;
  final String author;
  final DateTime createdAt;
  final bool isDead;

  Item({
    required this.id,
    required this.isDeleted,
    required this.author,
    required this.createdAt,
    required this.isDead,
  });
}

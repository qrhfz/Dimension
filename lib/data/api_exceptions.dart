class ItemNotFoundException implements Exception {
  final String message;

  ItemNotFoundException([this.message = "Item not found"]);
}

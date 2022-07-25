import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/repository/repository.dart';

final visitationFamily = StateNotifierProvider.family<VisitNotifier, bool, int>(
  (ref, id) {
    final repository = ref.read(repositoryProvider);
    return VisitNotifier(id: id, repository: repository);
  },
);

class VisitNotifier extends StateNotifier<bool> {
  final int id;
  final Repository repository;
  VisitNotifier({
    required this.id,
    required this.repository,
  }) : super(false) {
    load();
  }

  Future<void> load() async {
    if (!mounted) return;
    final visited = await repository.isLinkVisited(id);
    state = visited;
  }

  Future<void> visitStory() async {
    await repository.setLinkVisited(id);
    state = true;
  }
}

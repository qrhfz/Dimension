import 'package:flutter/material.dart';

class MyNavRail extends StatelessWidget {
  const MyNavRail({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        onDestinationSelected: onTap,
        destinations: const [
          NavigationRailDestination(icon: Icon(Icons.home), label: Text("Top")),
          NavigationRailDestination(
              icon: Icon(Icons.trending_up), label: Text("Best")),
          NavigationRailDestination(
              icon: Icon(Icons.update), label: Text("New")),
          NavigationRailDestination(
            icon: Icon(Icons.question_answer),
            label: Text("Ask HN"),
          ),
          NavigationRailDestination(
              icon: Icon(Icons.tips_and_updates_sharp), label: Text("Show HN")),
          NavigationRailDestination(
              icon: Icon(Icons.cases_outlined), label: Text("Jobs")),
        ],
        selectedIndex: currentIndex);
  }
}

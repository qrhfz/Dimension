import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).colorScheme.onSurface,
      unselectedItemColor: Theme.of(context).disabledColor,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Top"),
        BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: "Best"),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: "New"),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: "Ask HN",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates_sharp), label: "Show HN"),
        BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined), label: "Jobs"),
      ],
      onTap: onTap,
    );
  }
}

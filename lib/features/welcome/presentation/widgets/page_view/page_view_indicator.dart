import 'package:flutter/material.dart';
@Deprecated('Не используется')
class WelcomePageViewIndicator extends StatelessWidget {
  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  const WelcomePageViewIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 52, 16, 0),
        child: RotatedBox(
            quarterTurns: 1,
            child: TabPageSelector(
              controller: tabController,
              color: Colors.transparent,
              selectedColor: Colors.blue.shade600,
              borderStyle: BorderStyle.solid,
            )));
  }
}

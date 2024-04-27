import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/resources/theme.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colorScheme.secondaryContainer,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // Here, the items of BottomNavigationBar are hard coded. In a real
        // world scenario, the items would most likely be generated from the
        // branches of the shell route, which can be fetched using
        // `navigationShell.route.branches`.
        items: () {
          final items = [
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: '',
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            const BottomNavigationBarItem(icon: Icon(Icons.public), label: ''),
            const BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: ''),
          ];

          assert(navigationShell.route.branches.length == 4);

          return items;
        }(),
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (index, navigator) {
          return AnimatedScale(
            scale: index == currentIndex ? 1: 1.5,
            duration: const Duration(milliseconds: 400),
            child: AnimatedOpacity(
              opacity: index == currentIndex ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              child: _branchNavigatorWrapper(index, navigator),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) {
    return IgnorePointer(
      ignoring: index != currentIndex,
      child: TickerMode(
        enabled: index == currentIndex,
        child: navigator,
      ),
    );
  }
}

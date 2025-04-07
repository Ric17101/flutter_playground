import 'package:flutter/material.dart';

/// Dock of the reorderable [items].
class Dock<T> extends StatefulWidget {
  const Dock({
    super.key,
    this.items = const [],
    required this.builder,
  });

  /// Initial [T] items to put in this [Dock].
  final List<T> items;

  /// Builder building the provided [T] item.
  final Widget Function(T) builder;

  @override
  State<Dock<T>> createState() => _DockState<T>();
}

/// State of the [Dock] used to manipulate the [_items].
class _DockState<T> extends State<Dock<T>> {
  /// [T] items being manipulated.
  late final List<T> items = widget.items.toList();

  /// Initialization of the list [items]
  @override
  void initState() {
    /// Sorts the [items] based on its index
    items.sort((a, b) {
      debugPrint('${a.toString()}: $a');
      debugPrint('${b.toString()}: $b');

      /// Returns 1 when index a is greater than b, 0 otherwise
      return (items.indexOf(a) > items.indexOf(b)) ? 1 : 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black12,
      ),
      constraints: const BoxConstraints(minHeight: 48),
      height: 70,
      padding: const EdgeInsets.all(4),
      child: ReorderableListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        buildDefaultDragHandles: false,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        scrollDirection: Axis.horizontal,
        proxyDecorator: (child, index, animation) {
          /// Animates the dragging item on the list by scaling transition
          return ScaleTransition(
            scale: animation.drive(
              Tween<double>(begin: 1, end: 1.4).chain(
                CurveTween(curve: Curves.fastEaseInToSlowEaseOut),
              ),
            ),
            child: child,
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            debugPrint('newIndex: $newIndex');
            debugPrint('oldIndex: $oldIndex');

            /// Switches the [items] onReorder gesture of the items on their new order
            if (newIndex > oldIndex) {
              T item = items[oldIndex];
              items.removeAt(oldIndex);
              items.insert(newIndex - 1, item);
            } else {
              T item = items[oldIndex];
              items.removeAt(oldIndex);
              items.insert(newIndex, item);
            }
          });
        },
        children: items.map((e) {
          return ReorderableDragStartListener(
            key: UniqueKey(),
            index: items.indexOf(e),
            child: widget.builder(e),
          );
        }).toList(),
      ),
    );
  }
}

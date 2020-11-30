import 'package:flutter/material.dart';

class WidgetContainer extends StatelessWidget {
  final Widget child;

  WidgetContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: Theme.of(context).primaryColor.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      width: 160,
      height: 120,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  const MainCard({required this.backgroundColor, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        color: backgroundColor,
        child: child);
  }
}

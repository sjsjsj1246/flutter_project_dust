import 'package:flutter/material.dart';
import 'package:flutter_project_dust/const/colors.dart';

class MainCard extends StatelessWidget {
  final Widget child;
  const MainCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        color: LIGHT_COLOR,
        child: child);
  }
}

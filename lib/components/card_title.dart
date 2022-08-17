import 'package:flutter/material.dart';
import 'package:flutter_project_dust/const/colors.dart';

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: DARK_COLOR,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center),
        ));
  }
}

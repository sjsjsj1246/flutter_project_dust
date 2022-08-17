import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  final String category, imgPath, level, stat;
  final double width;

  const MainStat(
      {required this.category,
      required this.imgPath,
      required this.level,
      required this.stat,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);

    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(category, style: textStyle),
          const SizedBox(height: 8.0),
          Image.asset(imgPath, width: 50.0),
          const SizedBox(height: 8.0),
          Text(level),
          Text(stat),
        ],
      ),
    );
  }
}

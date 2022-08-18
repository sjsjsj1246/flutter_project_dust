import 'package:flutter/material.dart';
import 'package:flutter_project_dust/const/colors.dart';
import 'package:flutter_project_dust/model/stat_model.dart';
import 'package:flutter_project_dust/model/status_model.dart';

class MainAppBar extends StatelessWidget {
  final StatusModel status;
  final StatModel stat;

  const MainAppBar({required this.status, required this.stat, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: 30);
    return SliverAppBar(
      backgroundColor: status.primaryColor,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: kToolbarHeight),
          child: Column(
            children: [
              Text(
                "서울",
                style: textStyle.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                getTimeFromDateTime(dataTime: stat.dataTime),
                style: textStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset(
                status.imagePath,
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 20.0),
              Text(
                status.label,
                style: textStyle.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                status.comment,
                style: textStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  String getTimeFromDateTime({
    required DateTime dataTime,
  }) {
    return '${dataTime.year}년 ${dataTime.month}월 ${dataTime.day}일 ${getTimeFormat(dataTime.hour)}:${getTimeFormat(dataTime.minute)}';
  }

  String getTimeFormat(int number) {
    return number.toString().padLeft(2, '0');
  }
}

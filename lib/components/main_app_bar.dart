import 'package:flutter/material.dart';
import 'package:flutter_project_dust/model/stat_model.dart';
import 'package:flutter_project_dust/model/status_model.dart';
import 'package:flutter_project_dust/utils/data_utils.dart';

class MainAppBar extends StatelessWidget {
  final String region;
  final StatusModel status;
  final StatModel stat;
  final DateTime dateTime;
  final bool isExpanded;

  const MainAppBar(
      {required this.isExpanded,
      required this.dateTime,
      required this.region,
      required this.status,
      required this.stat,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: 30);
    return SliverAppBar(
      pinned: true,
      title: isExpanded
          ? null
          : Text(
              "$region ${DataUtils.getTimeFromDateTime(dateTime)}",
            ),
      backgroundColor: status.primaryColor,
      centerTitle: true,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: kToolbarHeight),
          child: Column(
            children: [
              Text(
                region,
                style: textStyle.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                DataUtils.getTimeFromDateTime(stat.dataTime),
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
}

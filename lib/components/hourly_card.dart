import 'package:flutter/material.dart';
import 'package:flutter_project_dust/components/card_title.dart';
import 'package:flutter_project_dust/components/main_card.dart';
import 'package:flutter_project_dust/model/stat_model.dart';
import 'package:flutter_project_dust/model/status_model.dart';
import 'package:flutter_project_dust/utils/data_utils.dart';

class HourlyCard extends StatelessWidget {
  final Color darkColor, lightColor;
  final String category, region;
  final List<StatModel> stats;

  const HourlyCard(
      {required this.stats,
      required this.category,
      required this.darkColor,
      required this.lightColor,
      required this.region,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainCard(
        backgroundColor: lightColor,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CardTitle(backgroundColor: darkColor, title: "시간별 $category"),
          Column(
            children: stats.map((stat) => renderRow(stat: stat)).toList(),
          )
        ]));
  }

  Widget renderRow({required StatModel stat}) {
    final StatusModel status = DataUtils.getStatusFromItemCodeAndValue(
        value: stat.getLevelFromModel(region), itemCode: stat.itemCode);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text('${stat.dataTime.hour}시')),
          Expanded(child: Image.asset(status.imagePath, height: 20.0)),
          Expanded(child: Text(status.label, textAlign: TextAlign.right)),
        ],
      ),
    );
  }
}

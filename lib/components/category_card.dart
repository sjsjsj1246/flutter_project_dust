import 'package:flutter/material.dart';
import 'package:flutter_project_dust/components/card_title.dart';
import 'package:flutter_project_dust/components/main_card.dart';
import 'package:flutter_project_dust/components/mame_stat.dart';
import 'package:flutter_project_dust/model/stat_and_status_model.dart';
import 'package:flutter_project_dust/utils/data_utils.dart';

class CategoryCard extends StatelessWidget {
  final String region;
  final List<StatAndStatusModel> models;
  const CategoryCard({required this.region, required this.models, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardTitle(title: "종류별 통계"),
            Expanded(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  children: models
                      .map((model) => MainStat(
                          width: constraints.maxWidth / 3,
                          category:
                              DataUtils.getItemCodeKrString(model.itemCode),
                          imgPath: model.status.imagePath,
                          level: model.status.label,
                          stat:
                              '${model.stat.getLevelFromModel(region)}${DataUtils.getUnitFromItemCode(model.itemCode)}'))
                      .toList()),
            )
          ],
        );
      })),
    );
  }
}

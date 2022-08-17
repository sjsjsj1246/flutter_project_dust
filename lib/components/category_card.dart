import 'package:flutter/material.dart';
import 'package:flutter_project_dust/components/card_title.dart';
import 'package:flutter_project_dust/components/main_card.dart';
import 'package:flutter_project_dust/components/mame_stat.dart';
import 'package:flutter_project_dust/const/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

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
                children: List.generate(
                    20,
                    (index) => MainStat(
                        width: constraints.maxWidth / 3,
                        category: "미세먼지",
                        imgPath: 'asset/img/best.png',
                        level: '최고',
                        stat: '0㎍/㎥')),
              ),
            )
          ],
        );
      })),
    );
  }
}
